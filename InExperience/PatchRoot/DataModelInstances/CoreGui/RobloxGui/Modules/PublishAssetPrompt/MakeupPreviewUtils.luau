local playersService = game:GetService("Players")
local constantsModule = require(script.Parent.Constants)
local t = {
	isMakeupAssetType = function(value) --[[ line: 11 ]]
		-- upvalues: constantsModule (ref)
		return constantsModule.MakeupAssetTypes[value] == true
	end
}
local t_1 = {
	[Enum.AvatarAssetType.FaceMakeup] = Enum.MakeupType.Face,
	[Enum.AvatarAssetType.LipMakeup] = Enum.MakeupType.Lip,
	[Enum.AvatarAssetType.EyeMakeup] = Enum.MakeupType.Eye
}
local t_2 = {
	[Enum.AvatarAssetType.EyebrowAccessory] = Enum.AccessoryType.Eyebrow,
	[Enum.AvatarAssetType.EyelashAccessory] = Enum.AccessoryType.Eyelash
}

local function addAssetToDescription(value, p0, p1) --[[ line: 27 ]]
	-- upvalues: t_1 (ref), t_2 (ref)
	local var6 = p1 and t_1[p1]
	local var7 = p1 and t_2[p1]
	
	if var6 then
		for i, v in ipairs(value:GetChildren()) do
			if v:IsA("MakeupDescription") then
				v:Destroy()
			end
		end
		local makeupDescription = Instance.new("MakeupDescription")
		makeupDescription.MakeupType = var6
		makeupDescription.Instance = p0
		makeupDescription.Parent = value
		
		return
	elseif var7 then
		local accessoryDescription = Instance.new("AccessoryDescription")
		accessoryDescription.AccessoryType = var7
		accessoryDescription.Instance = p0
		accessoryDescription.IsLayered = true
		accessoryDescription.Parent = value
	end
end

function t.createMakeupHeadPreview(_, _) --[[ line: 57 ]]
	-- upvalues: playersService (ref), addAssetToDescription (ref)
	local var10 = nil
	
	return nil
end

return t