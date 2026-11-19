local Parent = script.Parent

return require(Parent.Parent.Signals).createComputed((require(Parent.createInviteCandidatesStore)))