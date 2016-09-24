require_relative 'fundrequest'
require_relative 'project'

vc_friendly = FundRequest.new("VC-Friendly Start-up Projects")
vc_friendly.load_projects(ARGV.shift || "projects.csv")

loop do
  puts "How many rounds of funding requests? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/  # 1 or more digits
    vc_friendly.request_funding(Integer(answer))
  when 'quit', 'exit'
    vc_friendly.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

vc_friendly.save_projects