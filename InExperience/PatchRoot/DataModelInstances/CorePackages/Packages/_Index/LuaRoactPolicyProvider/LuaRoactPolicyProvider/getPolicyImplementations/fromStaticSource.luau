local function noOpt() end

return function()
	-- upvalues: noOpt (ref)
	return function(p0)
		-- upvalues: noOpt (copy)
		assert(p0, "expected externalPolicy")
		
		return {
			read = function()
				-- upvalues: p0 (ref)
				return p0
			end,
			onPolicyChanged = function(p1)
				-- upvalues: noOpt (copy)
				return Instance.new("BindableEvent").Event:Connect(p1 or noOpt)
			end
		}
	end
end