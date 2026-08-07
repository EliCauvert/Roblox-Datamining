local dependenciesModule = require(script.Parent.Parent.dependencies)
local roact = dependenciesModule.Roact
local llama = dependenciesModule.llama

return function(p0, p1) --[[ line: 20 ]]
	-- upvalues: roact (ref), llama (ref)
	local loadingTimer = roact.PureComponent:extend("LoadingTimer")
	
	function loadingTimer.init(p2) --[[ line: 24 ]]
		-- upvalues: p1 (ref)
		p2.loadingTime = {
			startTime = nil,
			endTime = nil,
			thresholdCanceled = false
		}
		
		function p2.startThresholdTimer() --[[ line: 31 ]]
			-- upvalues: p1 (copy), p2 (ref)
			if p1.loadingThreshold then
				delay(p1.loadingThreshold, function() --[[ line: 36 ]]
					-- upvalues: p1 (copy), p2 (copy)
					if p1.onReachingThreshold and not p2.thresholdCanceled and (not p2.loadingTime.endTime and p2.loadingTime.startTime) then
						p2.stopTimer(true)
						p1.onReachingThreshold(p2.getLoadingTime(), p2.props)
					end
				end)
				
				return
			end
		end
		
		function p2.resetTimer() --[[ line: 49 ]]
			-- upvalues: p2 (ref)
			p2.loadingTime = { startTime = nil, endTime = nil }
		end
		
		function p2.startTimer() --[[ line: 56 ]]
			-- upvalues: p2 (ref)
			p2.loadingTime.startTime = os.clock()
			p2.startThresholdTimer()
		end
		
		function p2.stopTimer(p3) --[[ line: 62 ]]
			-- upvalues: p2 (ref), p1 (copy)
			if p2.loadingTime.endTime then return end
			p2.loadingTime.endTime = os.clock()
			
			if p1.onLoaded and not p3 then
				p1.onLoaded(p2.getLoadingTime(), p2.props)
			end
		end
		
		function p2.getLoadingTime() --[[ line: 74 ]]
			-- upvalues: p2 (ref)
			return if p2.loadingTime.endTime and p2.loadingTime.startTime then p2.loadingTime.endTime - p2.loadingTime.startTime else -1
		end
		
		function p2.cancelThreshold() --[[ line: 82 ]]
			-- upvalues: p2 (ref)
			p2.thresholdCanceled = true
		end
	end
	
	function loadingTimer.render(p4) --[[ line: 87 ]]
		-- upvalues: roact (copy), p0 (ref), llama (copy)
		return roact.createElement(p0, llama.Dictionary.join(p4.props, {
			loadingTimerProps = {
				startTimer = p4.startTimer,
				stopTimer = p4.stopTimer,
				resetTimer = p4.resetTimer,
				getLoadingTime = p4.getLoadingTime,
				cancelThreshold = p4.cancelThreshold
			}
		}))
	end
	
	return loadingTimer
end