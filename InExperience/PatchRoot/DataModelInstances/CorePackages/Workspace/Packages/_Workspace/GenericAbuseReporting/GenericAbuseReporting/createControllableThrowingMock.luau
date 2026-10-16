local ReactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

return function() --[[ Line: 24 | Named "createControllableThrowingMock" ]]
	-- upvalues: ReactModule (copy)
	local config = { mode = nil, renderCount = 0 }
	
	return {
		reset = function() --[[ Line: 27 ]]
			-- upvalues: config (copy)
			config.mode = nil
			config.renderCount = 0
		end,
		setMode = function(Mode) --[[ Line: 32 ]]
			-- upvalues: config (copy)
			config.mode = Mode
		end,
		wrap = function(Callback) --[[ Line: 36 ]]
			-- upvalues: config (copy), ReactModule (upval)
			return function(p1) --[[ Line: 37 ]]
				-- upvalues: config (upval), ReactModule (upval), Callback (copy)
				config.renderCount += 1
				local RenderCount: number = config.renderCount
				local _, UseStateResult2 = ReactModule.useState(0)
				ReactModule.useEffect(function() --[[ Line: 42 ]]
					-- upvalues: config (upval), RenderCount (copy), UseStateResult2 (copy)
					if config.mode == "afterFirst" and RenderCount == 1 then
						UseStateResult2(1)
					end
				end, { RenderCount })
				
				if config.mode == "always" then
					error("simulated render error (pre-handle)")
				elseif config.mode == "afterFirst" and RenderCount > 1 then
					error("simulated render error (post-handle)")
				end
				return Callback(p1)
			end
		end
	}
end