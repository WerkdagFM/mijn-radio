set("log.stdout", true)

radio2 = input.http("https://icecast.omroep.nl/radio2-bb-mp3")
bnr = input.http("https://stream.bnr.nl/bnr_mp3_128_20")

def switch() =
  t = time()

  if (t >= 8h and t < 13h) then
    bnr
  else
    radio2
  end
end

output.file(%mp3, "stream.mp3", switch())
