options =
  consumer_key: 'rp02I9NlanW0Rt1vC6GA'
  consumer_secret: '0II62Hr66QiOKjmASsexCrzPJChkxon1icm2avyQrvM'
  access_token_key: '541346116-xaGlkJZN1xjCOsPWgJepxk7bFFkTwkqrn5G33fLn'
  access_token_secret: 'rzp5nBsqy2FvRAvgENKybQRpE5tUW8XLVi83Ozh3xUz3K'
client = new Twitter(options)
params = {}

if Meteor.isServer


  fs = Npm.require('fs')
  path = Npm.require('path')

  base = process.env.PWD
  file_path = base + '/private/seikin.png'
  file = fs.readFileSync(file_path);
  Twitter.postAsync client, 'media/upload', {media:file}, (error, media, response) ->
    if !error
      console.log media
      timestamp = Date.now()
      status =
        status: "APIから画像付きでツイートするテスト #{timestamp}",
        media_ids: media.media_id_string

      Twitter.postAsync client, 'statuses/update', status, (error, media, response) ->
        console.log(error)
