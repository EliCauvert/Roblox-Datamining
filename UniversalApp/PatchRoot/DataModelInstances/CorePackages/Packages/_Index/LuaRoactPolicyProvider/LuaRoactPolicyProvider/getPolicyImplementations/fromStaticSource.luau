local function noOpt() end

return function()
	-- upvalues: noOpt (copy)
	return function(p1)
		-- upvalues: noOpt (upval)
		assert(p1, "expected externalPolicy")
		
		return {
			read = function()
				-- upvalues: p1 (copy)
				return p1
			end,
			onPolicyChanged = function(p2)
				-- upvalues: noOpt (upval)
				return Instance.new("BindableEvent").Event:Connect(p2 or noOpt)
			end
		}
	end
end