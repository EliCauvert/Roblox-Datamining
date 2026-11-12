local ReplicatedFirst = game:GetService("ReplicatedFirst")

return {
	isRemoved = function()
		-- upvalues: ReplicatedFirst (copy)
		return ReplicatedFirst:IsDefaultLoadingGuiRemoved()
	end,
	subscribeRemoved = function(Callback)
		-- upvalues: ReplicatedFirst (copy)
		local DefaultLoadingGuiRemovedConnection = ReplicatedFirst.DefaultLoadingGuiRemoved:Connect(Callback)
		
		return function()
			-- upvalues: DefaultLoadingGuiRemovedConnection (copy)
			DefaultLoadingGuiRemovedConnection:Disconnect()
		end
	end
}