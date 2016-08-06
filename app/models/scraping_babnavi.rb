class ScrapingBabnavi

  def self.job_details #全求人情報を取得・保存（get_jobを使用)

    links = [] #「詳細」のhref属性を保存する配列
    next_url = "" #ページネーションの「次」のhref属性値
    agent = Mechanize.new #/result
    agent2 = Mechanize.new #第二階層用

    while true #全求人情報の「詳細」href属性をlinksに入れる。

      #第一階層(検索一覧)
      current_page = agent.get("https://bab-navi.com" + next_url) #検索一覧のURL取得。「次」でも同様処理を繰り返す。
      elements = current_page.search('.col3 a') #「詳細」aタグ
      elements.each do |ele|
        links << ele[:href]
      end

      #next_url(ページネーションの「次」のhref属性)を取得していく。
      next_link = current_page.at('.next a') #「次」タグ要素
      break unless next_link #「次」がなくなった際にwhile文を抜け出す。
      next_url = next_link[:href] #href属性を取り出してnext_urlに代入
    end

    links.each do |link| #link...詳細

      #第二階層(詳細-会社情報)
      second_page = agent2.get("https://bab-navi.com" + link) #会社情報画面のURL取得
>>>>>    employments = second_page.at('') #「新卒タブ」タグ要素。どうしたら取れる？(active/in-active)
      employments.each do |employment|
      end

    end


    binding.pry
    get_job('https://bab-navi.com' + 新卒タブのhref属性値)

  end

  def self.get_job(link) #各求人の情報を取得・保存
  end

end