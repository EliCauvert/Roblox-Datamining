local TweenService = game:GetService("TweenService")
local AudioDuckingFastInts = require(script:FindFirstAncestor("MomentsCreation").Parent.MomentsCommon).Media.audioDuckingFastInts
local self = setmetatable({}, { __mode = "k" })

return function(Target, Volume, p1)
	-- upvalues: self (copy), AudioDuckingFastInts (copy), TweenService (copy)
	local SelfEntry = self[Target]
	
	if SelfEntry ~= nil then
		SelfEntry:Cancel()
		self[Target] = nil
	end
	local CompressorParams = AudioDuckingFastInts.getCompressorParams()
	local Attack = if p1 then 0 elseif Volume < Target.Volume then CompressorParams.attack else CompressorParams.release
	
	if Attack <= 0 then
		Target.Volume = Volume
		
		return
	else
		local Tween = TweenService:Create(Target, TweenInfo.new(Attack, Enum.EasingStyle.Linear), { Volume = Volume })
		self[Target] = Tween
		Tween:Play()
	end
end