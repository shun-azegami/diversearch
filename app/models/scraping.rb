class Scraping

  def self.get_jobs #求人情報を取得する

    agent = Mechanize.new #インスタンス生成
    page = agent.get("") #URL取得
    elements = page.search('') #タグ取得

  end
end