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

local _ = function(p1)
	-- upvalues: getFFlagLuaAppEnableTopBanner (ref), guiService (ref)
	local var1 = 0
	
	if not getFFlagLuaAppEnableTopBanner() or p1 then
		if guiService then
			return guiService:GetGuiInset().Y
		end
		var1 = 50
	end
	return var1
end

local _ = function()
	return workspace.CurrentCamera.ViewportSize
end

local _ = function(p1)
	return p1 < 800
end

local _ = function(p1)
	return p1 < 624
end

local _ = function(p1)
	local x
	if p1.X >= 800 then
		x = p1.Y < 624 and (p1.X or 800)
	end
	return x
end

local _ = function(p1, p2)
	-- upvalues: getFFlagLuaAppEnableTopBanner (ref), guiService (ref)
	local var1
	if p1.X < 800 or p1.Y < 624 then
		var1 = p1.Y - (if not (getFFlagLuaAppEnableTopBanner() and not p2) then if guiService then guiService:GetGuiInset().Y else 50 else 0) or 624
	end
	return var1
end

local var1 = function(p1, p2)
	-- upvalues: getFFlagLuaAppEnableTopBanner (ref), guiService (ref)
	local x
	local new = UDim.new
	local var2 = 0
	
	if p1.X >= 800 then
		x = p1.Y < 624 and (p1.X or 800)
	end
	local var3
	new = new(var2, x)
	local new_1 = UDim.new
	local var4 = 0
	
	if p1.X < 800 or p1.Y < 624 then
		var3 = p1.Y - (if not (getFFlagLuaAppEnableTopBanner() and not p2) then if guiService then guiService:GetGuiInset().Y else 50 else 0) or 624
	end
	return UDim2.new(new, new_1(var4, var3))
end

local _ = function(p1)
	return if p1.X < 800 or p1.Y < 624 then "compact" else "default"
end

return function(p1)
	-- upvalues: isInExperienceUIVREnabled (ref), fFlagEnableInExperienceUIPCVRFix (ref), reactModule (ref), var1 (ref), gameInviteModalLayoutContextModule (ref)
	local isCoreScript = p1.isCoreScript
	local var2 = if isInExperienceUIVREnabled and fFlagEnableInExperienceUIPCVRFix and p1.screenSizeOverride then p1.screenSizeOverride else workspace.CurrentCamera.ViewportSize
	local var3, var4 = reactModule.useState(var1(var2, isCoreScript))
	local var5, var6 = reactModule.useState(var2.Y < 624)
	local var7, var8 = reactModule.useState(var2.X < 800)
	local useState = reactModule.useState
	local var9 = if var2.X < 800 or var2.Y < 624 then "compact" else "default"
	useState, var20 = useState(var9)
	local var10 = if fFlagEnableInExperienceUIPCVRFix then reactModule.useCallback(function()
		-- upvalues: var1 (copy), isCoreScript (ref), var6 (ref), var8 (ref), var4 (ref), var9 (ref)
		local viewportSize = workspace.CurrentCamera.ViewportSize
		viewportSize = viewportSize.Y < 624
		local var11 = viewportSize.X < 800
		local var12 = var1(viewportSize, isCoreScript)
		var6(viewportSize)
		var8(var11)
		var4(var12)
		var9(if viewportSize.X < 800 or viewportSize.Y < 624 then "compact" else "default")
	end, { isCoreScript }) else function()
		-- upvalues: var1 (copy), isCoreScript (ref), var6 (ref), var8 (ref), var4 (ref), var9 (ref)
		local viewportSize = workspace.CurrentCamera.ViewportSize
		viewportSize = viewportSize.Y < 624
		local var11 = viewportSize.X < 800
		local var12 = var1(viewportSize, isCoreScript)
		var6(viewportSize)
		var8(var11)
		var4(var12)
		var9(if viewportSize.X < 800 or viewportSize.Y < 624 then "compact" else "default")
	end
	reactModule.useEffect(function()
		-- upvalues: isInExperienceUIVREnabled (copy), fFlagEnableInExperienceUIPCVRFix (copy), p1 (ref), var10 (ref)
		if isInExperienceUIVREnabled and fFlagEnableInExperienceUIPCVRFix and p1.screenSizeOverride then
			return function() end
		end
		var10()
		local var11 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(var10)
		
		return function()
			-- upvalues: var11 (ref)
			if var11 then
				var11:Disconnect()
			end
		end
	end, if isInExperienceUIVREnabled and fFlagEnableInExperienceUIPCVRFix then { p1.screenSizeOverride, var10 } else {})
	
	return reactModule.createElement(gameInviteModalLayoutContextModule.Provider, {
		value = {
			isFullHeight = var5,
			isFullWidth = var7,
			modalSize = var3,
			modalMode = useState
		}
	}, p1.children)
end