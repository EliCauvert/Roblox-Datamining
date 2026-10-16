local Parent = script:FindFirstAncestor("VideoUtils").Parent

return game:DefineFastFlag("LuaAppVideoAutoplayElectOnNewCandidate", false) and require(Parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection