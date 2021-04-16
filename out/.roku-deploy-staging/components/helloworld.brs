 sub init()
      m.postergrid= m.top.findNode("postergrid")  
      m.postergrid.setFocus(true)
      createTask()
end sub


sub createTask()
      m.posterGridTask = CreateObject("roSGNode", "contentTask")
      m.posterGridTask.observeField ("output", "showpostergrid")
      m.posterGridTask.control = "RUN"
end sub

sub showPosterGrid()
      m.posterGrid.content = m.posterGridTask.output
      m.posterGridTask.control = "STOP"
      m.posterGridTask = invalid
end sub


