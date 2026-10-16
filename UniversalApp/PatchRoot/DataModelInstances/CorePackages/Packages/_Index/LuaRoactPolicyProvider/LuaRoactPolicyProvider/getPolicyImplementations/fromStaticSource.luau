local function noOpt() --[[ Line: 1 ]] end

return function() --[[ Line: 3 ]]
	-- upvalues: noOpt (copy)
	return function(p1) --[[ Line: 4 ]]
		-- upvalues: noOpt (upval)
		assert(p1, "expected externalPolicy")
		
		return {
			read = function() --[[ Line: 8 ]]
				-- upvalues: p1 (copy)
				return p1
			end,
			onPolicyChanged = function(p2) --[[ Line: 12 ]]
				-- upvalues: noOpt (upval)
				return Instance.new("BindableEvent").Event:Connect(p2 or noOpt)
			end
		}
	end
end