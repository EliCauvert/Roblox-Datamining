local Parent = script:FindFirstAncestor("Groups").Parent

return function()
	-- upvalues: Parent (copy)
	require(Parent.GroupPeekSdui).registerGroupAnnouncementActions()
end