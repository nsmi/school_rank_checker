require 'mechanize'

print "URLを貼ってください"
write = gets
base_uri = write
# URLをベースにHTMLデータを取得する処理、File.openやCSV.foreachみたいな物
agent = Mechanize.new
page = agent.get(base_uri)
# Googleの検索結果はh3タグで表示されるので、HTMLの中からh3タグだけを抜き出している処理
titles = page.search('#school')
# 取得したタグの中のHTMLテキストを表示
@dete = titles.inner_text

school = @dete.split(' ')

target =  school# 元となるデータ
list = ["採用実績（学校）","＜大学院＞", "＜大学＞","University(2016～2020年度実績)","＜短大・高専・専門学校＞",""] # 削除対象の文字列のリスト
target.delete_if do |str|
  list.include?(str)
end
p target


write_string = target
# puts write_string
File.open("hello.txt", mode = "w") do |f|
f.write(write_string)
f.close # ファイルを開いたら閉じる
end
ara=File.open("arank.txt")
asa=ara.read
aschool = asa.split('・')
@arank = aschool
@ak = 0

bra=File.open("brank.txt")
bsa=bra.read
bschool = bsa.split('・')
@brank = bschool
@bk = 0

cra=File.open("crank.txt")
csa=cra.read
cschool = csa.split('・')
@crank = cschool
@ck = 0

dra=File.open("drank.txt")
dsa=dra.read
dschool = dsa.split('、')
@drank = dschool
@dk = 0

fra=File.open("rank.txt")
sab=fra.read
fschool = sab.split('、')
@frank = fschool

@k = 0

f=File.open("hello.txt")
s=f.read
school = s.split('、')
v = 0
p school


school.each do |x|
  b = []
  v = v + 1
  puts "#{x}　　#{v}校目"

    # arank.each do |a|
    #     if x == a
    #         puts "a"
    #         puts a
    #     end
    # end
    # brank.each do |b|
    #     if x == b
    #         puts "b"
    #         puts b
    #     end
    # end
    @arank.each do |a|
        if x == "#{a}学"
            # puts "f"
            # puts d
            @ak = @ak + 1

            puts "Aランクの大学は#{@ak}校ありました"
            puts ""
        end
    end
    @brank.each do |b|
        if x == "#{b}学"
            # puts "f"
            # puts d
            @bk = @bk + 1

            puts "Bランクの大学は#{@bk}校ありました"
            puts ""
        end
    end    
    @crank.each do |c|
        if x == "#{c}学"
            # puts "f"
            # puts d
            @ck = @ck + 1

            puts "Cランクの大学は#{@ck}校ありました"
            puts ""
        end
    end
    @drank.each do |d|
        if x == "#{d}学"
            # puts "f"
            # puts d
            @dk = @dk + 1

            puts "Dランクの大学は#{@dk}校ありました"
            puts ""
        end
    end
    
    @frank.each do |f|
        if x == f
            # puts "f"
            # puts f
            @k = @k + 1

            puts "Fランクの大学は#{@k}校ありました"
            puts ""
        end
    end
    puts "#{x}　　#{v}校目 A#{@ak}　B#{@bk}　C#{@ck}　D#{@dk}　F#{@k}　その他#{@ak + @bk + @ck + @dk + @k - v}"

end