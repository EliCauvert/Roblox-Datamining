local tweenService = game:GetService("TweenService")
local audioDuckingFastInts = require(script:FindFirstAncestor("MomentsCreation").Parent.MomentsCommon).Media.audioDuckingFastInts
local tbl = setmetatable({}, { __mode = "k" })

return function(p1, p2, p3)
	-- upvalues: tbl (ref), audioDuckingFastInts (ref), tweenService (ref)
	local var1 = tbl[p1]
	
	if var1 ~= nil then
		var1:Cancel()
		tbl[p1] = nil
	end
	local compressorParams = audioDuckingFastInts.getCompressorParams()
	local var2 = if p3 then 0 elseif p2 < p1.Volume then compressorParams.attack else compressorParams.release
	
	if var2 <= 0 then
		p1.Volume = p2
		
		return
	end
	local var3 = tweenService:Create(p1, TweenInfo.new(var2, Enum.EasingStyle.Linear), { Volume = p2 })
	tbl[p1] = var3
	var3:Play()
end