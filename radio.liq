set("log.stdout", true)

radio2 = input.http("https://icecast.omroep.nl/radio2-bb-mp3")
bnr = input.http("https://stream.bnr.nl/bnr_mp3_128_20")

s = fallback([
  switch([({ 8h-13h }, bnr)]),
  radio2
])

output.file(%mp3, "out.mp3", s)
