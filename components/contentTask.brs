sub init()
    m.top.functionName = "content"
end sub

sub content()
    urlTransfer = CreateObject("roUrlTransfer")
    urlTransfer.setUrl("https://jonathanbduval.com/roku/feeds/roku-developers-feed-v1.json")
    urlTransfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    urlTransfer.InitClientCertificates()
    stringBody = urlTransfer.getToString()
    data = parseJson(stringBody)
    '?data.profile
    
    pgContent = createObject("roSGNode", "ContentNode")
        
    ?">>API ";data.shortFormVideos[0].tags

    for i = 0 to data.shortFormVideos.count() - 1
      
      profile = data.shortFormVideos[i]
        
      itemContentNode = pgContent.createChild("ContentNode")
      itemContentNode.shortdescriptionline1 = profile.releaseDate
      itemContentNode.HDPosterUrl = profile.thumbnail
      

    end for

    m.top.output = pgContent
  
  end sub

