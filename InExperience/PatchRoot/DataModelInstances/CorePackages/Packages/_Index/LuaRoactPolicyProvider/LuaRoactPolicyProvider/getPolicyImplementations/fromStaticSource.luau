local function noOpt() end

return function()
	-- upvalues: noOpt (ref)
	return function(p1)
		-- upvalues: noOpt (copy)
		assert(p1, "expected externalPolicy")
		
		return {
			read = function()
				-- upvalues: p1 (ref)
				return p1
			end,
			onPolicyChanged = function(p2)
				-- upvalues: noOpt (copy)
				return Instance.new("BindableEvent").Event:Connect(p2 or noOpt)
			end
		}
	end
end