local Moments = script:FindFirstAncestor("Moments")
local RunService = game:GetService("RunService")
local ReactModule = require(Moments.Parent.React)
local EstimatePostingProgressModule = require(Moments.Components.PostFeedback.estimatePostingProgress)
game:DefineFastInt("MomentsPostingProgressSeconds", 100)
game:DefineFastInt("MomentsPostingProgressTargetPercent", 90)

local function _(p1)
	-- upvalues: EstimatePostingProgressModule (copy)
	return if p1 == nil then 0 else EstimatePostingProgressModule(os.clock(), p1, game:GetFastInt("MomentsPostingProgressSeconds"), game:GetFastInt("MomentsPostingProgressTargetPercent") / 100) * 100
end

return function(p1)
	-- upvalues: ReactModule (copy), EstimatePostingProgressModule (copy), RunService (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(if p1 == nil then 0 else EstimatePostingProgressModule(os.clock(), p1, game:GetFastInt("MomentsPostingProgressSeconds"), game:GetFastInt("MomentsPostingProgressTargetPercent") / 100) * 100)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseBindingResult2 (copy), EstimatePostingProgressModule (upval), RunService (upval)
		if p1 == nil then
			return nil
		else
			UseBindingResult2(if p1 == nil then 0 else EstimatePostingProgressModule(os.clock(), p1, game:GetFastInt("MomentsPostingProgressSeconds"), game:GetFastInt("MomentsPostingProgressTargetPercent") / 100) * 100)
			local HeartbeatConnection = RunService.Heartbeat:Connect(function()
				-- upvalues: UseBindingResult2 (upval), p1 (upval), EstimatePostingProgressModule (upval)
				UseBindingResult2(if p1 == nil then 0 else EstimatePostingProgressModule(os.clock(), p1, game:GetFastInt("MomentsPostingProgressSeconds"), game:GetFastInt("MomentsPostingProgressTargetPercent") / 100) * 100)
			end)
			
			return function()
				-- upvalues: HeartbeatConnection (copy)
				HeartbeatConnection:Disconnect()
			end
		end
	end, { p1 })
	
	return if p1 == nil then nil else UseBindingResult
end