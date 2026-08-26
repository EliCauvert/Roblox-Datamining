local dependenciesModule = require(script.Parent.Parent.dependencies)
local roact = dependenciesModule.Roact
local llama = dependenciesModule.llama

return function(p1, p2)
	-- upvalues: roact (ref), llama (ref)
	local loadingTimer = roact.PureComponent:extend("LoadingTimer")
	
	function loadingTimer.init(p3)
		-- upvalues: p2 (ref)
		p3.loadingTime = {
			startTime = nil,
			endTime = nil,
			thresholdCanceled = false
		}
		
		function p2.startThresholdTimer()
			-- upvalues: p2 (copy), p3 (ref)
			if p2.loadingThreshold then
				delay(p2.loadingThreshold, function()
					-- upvalues: p2 (copy), p3 (copy)
					if p2.onReachingThreshold and not p3.thresholdCanceled and (not p3.loadingTime.endTime and p3.loadingTime.startTime) then
						p3.stopTimer(true)
						p2.onReachingThreshold(p3.getLoadingTime(), p3.props)
					end
				end)
				
				return
			end
		end
		
		function p2.resetTimer()
			-- upvalues: p3 (ref)
			p3.loadingTime = { startTime = nil, endTime = nil }
		end
		
		function p2.startTimer()
			-- upvalues: p3 (ref)
			p3.loadingTime.startTime = os.clock()
			p3.startThresholdTimer()
		end
		
		function p2.stopTimer(p4)
			-- upvalues: p3 (ref), p2 (copy)
			if p3.loadingTime.endTime then return end
			p3.loadingTime.endTime = os.clock()
			
			if p2.onLoaded and not p4 then
				p2.onLoaded(p3.getLoadingTime(), p3.props)
			end
		end
		
		function p2.getLoadingTime()
			-- upvalues: p3 (ref)
			return if p3.loadingTime.endTime and p3.loadingTime.startTime then p3.loadingTime.endTime - p3.loadingTime.startTime else -1
		end
		
		function p2.cancelThreshold()
			-- upvalues: p3 (ref)
			p3.thresholdCanceled = true
		end
	end
	
	function loadingTimer.render(p3)
		-- upvalues: roact (copy), p1 (ref), llama (copy)
		return roact.createElement(p1, llama.Dictionary.join(p3.props, {
			loadingTimerProps = {
				startTimer = p3.startTimer,
				stopTimer = p3.stopTimer,
				resetTimer = p3.resetTimer,
				getLoadingTime = p3.getLoadingTime,
				cancelThreshold = p3.cancelThreshold
			}
		}))
	end
	
	return loadingTimer
end