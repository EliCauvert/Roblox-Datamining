local DependenciesModule = require(script.Parent.Parent.dependencies)
local Roact = DependenciesModule.Roact
local Llama = DependenciesModule.llama

return function(p1, p2) --[[ Line: 20 ]]
	-- upvalues: Roact (copy), Llama (copy)
	local LoadingTimer = Roact.PureComponent:extend("LoadingTimer")
	
	function LoadingTimer.init(p3) --[[ Line: 24 ]]
		-- upvalues: p2 (copy)
		p3.loadingTime = {
			startTime = nil,
			endTime = nil,
			thresholdCanceled = false
		}
		
		function p3.startThresholdTimer() --[[ Line: 31 ]]
			-- upvalues: p2 (upval), p3 (copy)
			if p2.loadingThreshold then
				delay(p2.loadingThreshold, function() --[[ Line: 36 ]]
					-- upvalues: p2 (upval), p3 (upval)
					if p2.onReachingThreshold and not p3.thresholdCanceled and not p3.loadingTime.endTime and p3.loadingTime.startTime then
						p3.stopTimer(true)
						p2.onReachingThreshold(p3.getLoadingTime(), p3.props)
					end
				end)
				
				return
			end
		end
		
		function p3.resetTimer() --[[ Line: 49 ]]
			-- upvalues: p3 (copy)
			p3.loadingTime = { startTime = nil, endTime = nil }
		end
		
		function p3.startTimer() --[[ Line: 56 ]]
			-- upvalues: p3 (copy)
			p3.loadingTime.startTime = os.clock()
			p3.startThresholdTimer()
		end
		
		function p3.stopTimer(p4) --[[ Line: 62 ]]
			-- upvalues: p3 (copy), p2 (upval)
			if p3.loadingTime.endTime then return end
			p3.loadingTime.endTime = os.clock()
			
			if p2.onLoaded and not p4 then
				p2.onLoaded(p3.getLoadingTime(), p3.props)
			end
		end
		
		function p3.getLoadingTime() --[[ Line: 74 ]]
			-- upvalues: p3 (copy)
			return if p3.loadingTime.endTime and p3.loadingTime.startTime then p3.loadingTime.endTime - p3.loadingTime.startTime else -1
		end
		
		function p3.cancelThreshold() --[[ Line: 82 ]]
			-- upvalues: p3 (copy)
			p3.thresholdCanceled = true
		end
	end
	
	function LoadingTimer.render(p3) --[[ Line: 87 ]]
		-- upvalues: Roact (upval), p1 (copy), Llama (upval)
		return Roact.createElement(p1, Llama.Dictionary.join(p3.props, {
			loadingTimerProps = {
				startTimer = p3.startTimer,
				stopTimer = p3.stopTimer,
				resetTimer = p3.resetTimer,
				getLoadingTime = p3.getLoadingTime,
				cancelThreshold = p3.cancelThreshold
			}
		}))
	end
	
	return LoadingTimer
end