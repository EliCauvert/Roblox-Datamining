local GuiService = game:GetService("GuiService")
local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local ReactModule = require(Parent.React)
local _ = require(GameInvite.gameInviteModalType)
local GameInviteModalLayoutContextModule = require(GameInvite.Context.GameInviteModalLayoutContext)
local GetFFlagLuaAppEnableTopBannerFunction = SharedFlagsModule.GetFFlagLuaAppEnableTopBanner
local IsInExperienceUIVREnabled = require(Parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local FFlagEnableInExperienceUIPCVRFix = SharedFlagsModule.FFlagEnableInExperienceUIPCVRFix

local function _(p1)
	-- upvalues: GetFFlagLuaAppEnableTopBannerFunction (copy), GuiService (copy)
	local v1 = 0
	
	if not GetFFlagLuaAppEnableTopBannerFunction() or p1 then
		if GuiService then
			return GuiService:GetGuiInset().Y
		end
		v1 = 50
	end
	return v1
end

local _ = function()
	return workspace.CurrentCamera.ViewportSize
end

local _ = function(p1: number): boolean
	return p1 < 800
end

local _ = function(p1: number): boolean
	return p1 < 624
end

local _ = function(Vector)
	return (if Vector.X < 800 then Vector.X else Vector.Y < 624 and Vector.X) or 800
end

local _ = function(Vector, p1)
	-- upvalues: GetFFlagLuaAppEnableTopBannerFunction (copy), GuiService (copy)
	return (if Vector.X < 800 then Vector.Y - (if GetFFlagLuaAppEnableTopBannerFunction() and not p1 then 0 elseif GuiService then GuiService:GetGuiInset().Y else 50) else Vector.Y < 624 and Vector.Y - (if GetFFlagLuaAppEnableTopBannerFunction() and not p1 then 0 elseif GuiService then GuiService:GetGuiInset().Y else 50)) or 624
end

local function v15(Vector, IsCoreScript): UDim2
	-- upvalues: GetFFlagLuaAppEnableTopBannerFunction (copy), GuiService (copy)
	return UDim2.new(UDim.new(0, (if Vector.X < 800 then Vector.X else Vector.Y < 624 and Vector.X) or 800), (UDim.new(0, (if Vector.X < 800 then Vector.Y - (if GetFFlagLuaAppEnableTopBannerFunction() and not IsCoreScript then 0 elseif GuiService then GuiService:GetGuiInset().Y else 50) else Vector.Y < 624 and Vector.Y - (if GetFFlagLuaAppEnableTopBannerFunction() and not IsCoreScript then 0 elseif GuiService then GuiService:GetGuiInset().Y else 50)) or 624)))
end

local _ = function(Vector): string
	if Vector.X < 800 or Vector.Y < 624 then
		return "compact"
	else
		return "default"
	end
end

return function(p1)
	-- upvalues: IsInExperienceUIVREnabled (copy), FFlagEnableInExperienceUIPCVRFix (copy), ReactModule (copy), v15 (copy), GameInviteModalLayoutContextModule (copy)
	local IsCoreScript = p1.isCoreScript
	local ScreenSizeOverride = if IsInExperienceUIVREnabled and FFlagEnableInExperienceUIPCVRFix and p1.screenSizeOverride then p1.screenSizeOverride else workspace.CurrentCamera.ViewportSize
	local UseStateResult, UseStateResult2 = ReactModule.useState(v15(ScreenSizeOverride, IsCoreScript))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(ScreenSizeOverride.Y < 624)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(ScreenSizeOverride.X < 800)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(if ScreenSizeOverride.X < 800 then "compact" elseif ScreenSizeOverride.Y < 624 then "compact" else "default")
	local UseResult = if FFlagEnableInExperienceUIPCVRFix then ReactModule.useCallback(function()
		-- upvalues: v15 (upval), IsCoreScript (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseStateResult2 (copy), UseStateResult2_3 (copy)
		local ViewportSize = workspace.CurrentCamera.ViewportSize
		local IsYBelow = ViewportSize.Y < 624
		local IsXBelow = ViewportSize.X < 800
		local v1 = v15(ViewportSize, IsCoreScript)
		UseStateResult2_1(IsYBelow)
		UseStateResult2_2(IsXBelow)
		UseStateResult2(v1)
		UseStateResult2_3(if ViewportSize.X < 800 then "compact" elseif ViewportSize.Y < 624 then "compact" else "default")
	end, { IsCoreScript }) else function()
		-- upvalues: v15 (upval), IsCoreScript (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseStateResult2 (copy), UseStateResult2_3 (copy)
		local ViewportSize = workspace.CurrentCamera.ViewportSize
		local IsYBelow = ViewportSize.Y < 624
		local IsXBelow = ViewportSize.X < 800
		local v1 = v15(ViewportSize, IsCoreScript)
		UseStateResult2_1(IsYBelow)
		UseStateResult2_2(IsXBelow)
		UseStateResult2(v1)
		UseStateResult2_3(if ViewportSize.X < 800 then "compact" elseif ViewportSize.Y < 624 then "compact" else "default")
	end
	ReactModule.useEffect(function()
		-- upvalues: IsInExperienceUIVREnabled (upval), FFlagEnableInExperienceUIPCVRFix (upval), p1 (copy), UseResult (copy)
		if IsInExperienceUIVREnabled and FFlagEnableInExperienceUIPCVRFix and p1.screenSizeOverride then
			return function() end
		else
			UseResult()
			local Connection = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UseResult)
			
			return function()
				-- upvalues: Connection (copy)
				if Connection then
					Connection:Disconnect()
				end
			end
		end
	end, if IsInExperienceUIVREnabled and FFlagEnableInExperienceUIPCVRFix then { p1.screenSizeOverride, UseResult } else {})
	
	return ReactModule.createElement(GameInviteModalLayoutContextModule.Provider, {
		value = {
			isFullHeight = UseStateResult1,
			isFullWidth = UseStateResult3,
			modalSize = UseStateResult,
			modalMode = UseStateResult4
		}
	}, p1.children)
end