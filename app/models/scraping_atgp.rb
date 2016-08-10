class ScrapingAtgp

  def self.job_details
    links = []
    next_url = ""
    agent = Mechanize.new

    current_page = agent.get("https://www.atgp.jp/index.php?module=Search&action=Query_detail")
    elements = current_page.search('.bt01_1 a')
    elements.each do |element|
      links << element[:href]
    end


    while true do
      current_page = agent.get("https://www.atgp.jp" + next_url )
      elements = current_page.search('.bt01_1 a')
      elements.each do |ele|
        links << ele[:href]
      end

      next_link = current_page.at('.next a')
      break unless next_link
      next_url = next_link[:href]
    end

    links.each do |link|
      get_job("https://www.atgp.jp/" + link) #「次」と「詳細」で、href属性の初めの"/"有無に注意
    end
  end

  def self.get_job(link)
    agent = Mechanize.new
    page = agent.get(link)
    data = page.search('.tableStyle02 td') #募集要項内の各項目がクラス分けされていないので、まとめた配列として一旦取得し、任意のバリューを取りだす。

    company = page.at('.header .apply').inner_text if page.at('.header .apply') #企業名
    title = data[0].inner_text #募集職種
    location = data[9].inner_text #勤務地・所在地
    job_type = data[4].inner_text #雇用体系
    detail = data[2].inner_text #詳細
    url = link #外部リンク

    job = Job.where(company: company).first_or_initialize
    job.company = company
    job.title = title
    job.location = location
    job.job_type = job_type
    job.detail = detail
    job.url = url

    job.save
  end
end