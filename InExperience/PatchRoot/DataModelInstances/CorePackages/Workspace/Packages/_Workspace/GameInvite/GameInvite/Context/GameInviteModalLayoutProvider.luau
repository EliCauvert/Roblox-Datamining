local guiService = game:GetService("GuiService")
local gameInvite = script:FindFirstAncestor("GameInvite")
local context = gameInvite.Context
local parent = gameInvite.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local reactModule = require(parent.React)
local _ = require(gameInvite.gameInviteModalType)
local gameInviteModalLayoutContextModule = require(context.GameInviteModalLayoutContext)
local getFFlagLuaAppEnableTopBanner = sharedFlagsModule.GetFFlagLuaAppEnableTopBanner
local isInExperienceUIVREnabled = require(parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local fFlagEnableInExperienceUIPCVRFix = sharedFlagsModule.FFlagEnableInExperienceUIPCVRFix

local _ = function(p0)
	-- upvalues: getFFlagLuaAppEnableTopBanner (ref), guiService (ref)
	local var6 = 0
	
	if not getFFlagLuaAppEnableTopBanner() or p0 then
		if guiService then
			return guiService:GetGuiInset().Y
		end
		var6 = 50
	end
	return var6
end

local _ = function()
	return workspace.CurrentCamera.ViewportSize
end

local _ = function(p1)
	return p1 < 800
end

local _ = function(p2)
	return p2 < 624
end

local _ = function(p3)
	local x
	if p3.X >= 800 then
		x = p3.Y < 624 and (p3.X or 800)
	end
	return x
end

local _ = function(p4, p5)
	-- upvalues: getFFlagLuaAppEnableTopBanner (ref), guiService (ref)
	local var8
	if p4.X < 800 or p4.Y < 624 then
		var8 = p4.Y - (if not (getFFlagLuaAppEnableTopBanner() and not p5) then if guiService then guiService:GetGuiInset().Y else 50 else 0) or 624
	end
	return var8
end

local var5 = function(p6, p7)
	-- upvalues: getFFlagLuaAppEnableTopBanner (ref), guiService (ref)
	local x
	local new = UDim.new
	local var9 = 0
	
	if p6.X >= 800 then
		x = p6.Y < 624 and (p6.X or 800)
	end
	local var12
	new = new(var9, x)
	local new_1 = UDim.new
	local var11 = 0
	
	if p6.X < 800 or p6.Y < 624 then
		var12 = p6.Y - (if not (getFFlagLuaAppEnableTopBanner() and not p7) then if guiService then guiService:GetGuiInset().Y else 50 else 0) or 624
	end
	return UDim2.new(new, new_1(var11, var12))
end

local _ = function(p8)
	return if p8.X < 800 or p8.Y < 624 then "compact" else "default"
end

return function(p9)
	-- upvalues: isInExperienceUIVREnabled (ref), fFlagEnableInExperienceUIPCVRFix (ref), reactModule (ref), var5 (ref), gameInviteModalLayoutContextModule (ref)
	local isCoreScript = p9.isCoreScript
	local var13 = if isInExperienceUIVREnabled and fFlagEnableInExperienceUIPCVRFix and p9.screenSizeOverride then p9.screenSizeOverride else workspace.CurrentCamera.ViewportSize
	local var14, var15 = reactModule.useState(var5(var13, isCoreScript))
	local var16, var17 = reactModule.useState(var13.Y < 624)
	local var18, var19 = reactModule.useState(var13.X < 800)
	local useState = reactModule.useState
	local var20 = if var13.X < 800 or var13.Y < 624 then "compact" else "default"
	useState, var20 = useState(var20)
	local var21 = if fFlagEnableInExperienceUIPCVRFix then reactModule.useCallback(function()
		-- upvalues: var5 (copy), isCoreScript (ref), var17 (ref), var19 (ref), var15 (ref), var20 (ref)
		local viewportSize = workspace.CurrentCamera.ViewportSize
		viewportSize = viewportSize.Y < 624
		local var24 = viewportSize.X < 800
		local var25 = var5(viewportSize, isCoreScript)
		var17(viewportSize)
		var19(var24)
		var15(var25)
		var20(if viewportSize.X < 800 or viewportSize.Y < 624 then "compact" else "default")
	end, { isCoreScript }) else function()
		-- upvalues: var5 (copy), isCoreScript (ref), var17 (ref), var19 (ref), var15 (ref), var20 (ref)
		local viewportSize = workspace.CurrentCamera.ViewportSize
		viewportSize = viewportSize.Y < 624
		local var22 = viewportSize.X < 800
		local var23 = var5(viewportSize, isCoreScript)
		var17(viewportSize)
		var19(var22)
		var15(var23)
		var20(if viewportSize.X < 800 or viewportSize.Y < 624 then "compact" else "default")
	end
	reactModule.useEffect(function()
		-- upvalues: isInExperienceUIVREnabled (copy), fFlagEnableInExperienceUIPCVRFix (copy), p9 (ref), var21 (ref)
		if isInExperienceUIVREnabled and fFlagEnableInExperienceUIPCVRFix and p9.screenSizeOverride then
			return function() end
		end
		var21()
		local var26 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(var21)
		
		return function()
			-- upvalues: var26 (ref)
			if var26 then
				var26:Disconnect()
			end
		end
	end, if isInExperienceUIVREnabled and fFlagEnableInExperienceUIPCVRFix then { p9.screenSizeOverride, var21 } else {})
	
	return reactModule.createElement(gameInviteModalLayoutContextModule.Provider, {
		value = {
			isFullHeight = var16,
			isFullWidth = var18,
			modalSize = var14,
			modalMode = useState
		}
	}, p9.children)
end