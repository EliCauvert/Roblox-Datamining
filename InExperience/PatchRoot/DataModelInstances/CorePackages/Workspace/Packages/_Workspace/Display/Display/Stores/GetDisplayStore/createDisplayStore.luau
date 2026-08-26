local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local appCommonLibModule = require(parent_1.AppCommonLib)
local vrCompatibilityModule = require(parent_1.VrCompatibility)
local getGlobalGuiInsetModule = require(parent.getGlobalGuiInset)
local fIntLuaAppSmallScreenDesignWidthModule = require(parent.Flags.FIntLuaAppSmallScreenDesignWidth)
local enableDisplaySizeEngineFeature = game:GetEngineFeature("EnableDisplaySize")
local debugLuaAppEnableScale = game:DefineFastFlag("DebugLuaAppEnableScale", false)
local debugLuaAppEnableScale_1 = debugLuaAppEnableScale or game:DefineFastFlag("FFlagLuaAppEnableWindowsHandheldScale", false) and enableDisplaySizeEngineFeature
local fFlagDebugForceConsoleSafeInsets = require(parent_1.SharedFlags).FFlagDebugForceConsoleSafeInsets
local var1 = guiService:IsTenFootInterface()

local function forceConsoleSafeInsets(value)
	-- upvalues: parent_1 (ref)
	local messageBus = require(parent_1.MessageBus).MessageBus
	local tModule = require(parent_1.t)
	messageBus.publish({
		mid = messageBus.getMessageId("Screen", "safeAreaInsets"),
		validateParams = tModule.strictInterface({
			left = tModule.number,
			top = tModule.number,
			right = tModule.number,
			bottom = tModule.number
		})
	}, {
		left = value.X * 0.05 / 1.5,
		top = value.Y * 0.05 / 1.5,
		right = value.X * 0.05 / 1.5,
		bottom = value.Y * 0.05 / 1.5
	})
end

return function()
	-- upvalues: signalsModule (ref), appCommonLibModule (ref), guiService (ref), vrCompatibilityModule (ref), fFlagDebugForceConsoleSafeInsets (ref), forceConsoleSafeInsets (ref), enableDisplaySizeEngineFeature (ref), getGlobalGuiInsetModule (ref), debugLuaAppEnableScale (ref), fIntLuaAppSmallScreenDesignWidthModule (ref), debugLuaAppEnableScale_1 (ref), var1 (ref)
	local _ = nil
	local var2, var3 = signalsModule.createSignal(workspace.CurrentCamera)
	local var4 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		-- upvalues: var3 (ref)
		var3(workspace.CurrentCamera)
	end)
	local _ = nil
	local var5, var6 = signalsModule.createSignal(appCommonLibModule.isSpatial())
	local var7 = appCommonLibModule.connectToIsSpatialChanged(function(p1)
		-- upvalues: var6 (ref)
		var6(p1)
	end)
	
	local function calculateDeviceSafePadding()
		-- upvalues: guiService (copy)
		local noneInsetArea = guiService:GetInsetArea(Enum.ScreenInsets.None)
		local deviceSafeInsetsInsetArea = guiService:GetInsetArea(Enum.ScreenInsets.DeviceSafeInsets)
		
		return {
			left = deviceSafeInsetsInsetArea.Min.X - noneInsetArea.Min.X,
			top = deviceSafeInsetsInsetArea.Min.Y - noneInsetArea.Min.Y,
			right = noneInsetArea.Max.X - deviceSafeInsetsInsetArea.Max.X,
			bottom = noneInsetArea.Max.Y - deviceSafeInsetsInsetArea.Max.Y
		}
	end
	
	local var8, var9 = signalsModule.createSignal(calculateDeviceSafePadding())
	local vector2 = Vector2.new(1, 1)
	local var10 = var2(false)
	
	if var10 then
		vector2 = var10.ViewportSize
	end
	local var11, var12 = signalsModule.createSignal(vector2)
	local var13 = nil
	local var14 = signalsModule.createEffect(function(p1)
		-- upvalues: var2 (ref), var13 (write), var5 (ref), var12 (ref), vrCompatibilityModule (copy), var9 (ref), calculateDeviceSafePadding (ref), fFlagDebugForceConsoleSafeInsets (copy), forceConsoleSafeInsets (copy), var11 (ref)
		local var15 = var2(p1)
		
		if var15 then
			if var13 then
				var13:Disconnect()
				var13 = nil
			end
			if var5(p1) then
				var12(vrCompatibilityModule.VRConstants.MainScreenResolution)
				
				return
			end
			var13 = var15:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				-- upvalues: var12 (copy), var15 (ref), var9 (copy), calculateDeviceSafePadding (copy), fFlagDebugForceConsoleSafeInsets (copy), forceConsoleSafeInsets (copy), var11 (copy), p1 (ref)
				var12(var15.ViewportSize)
				var9(calculateDeviceSafePadding())
				
				if fFlagDebugForceConsoleSafeInsets then
					forceConsoleSafeInsets(var11(p1))
				end
			end)
		end
	end)
	local var15, var16 = signalsModule.createSignal(if enableDisplaySizeEngineFeature then guiService.ViewportDisplaySize else nil)
	local var17 = if enableDisplaySizeEngineFeature then guiService:GetPropertyChangedSignal("ViewportDisplaySize"):Connect(function()
		-- upvalues: var16 (ref), guiService (copy)
		var16(guiService.ViewportDisplaySize)
	end) else nil
	local var18 = getGlobalGuiInsetModule()
	local var19, var20 = signalsModule.createSignal(var18)
	local var21, var22 = signalsModule.createSignal(var18.top)
	local var23 = signalsModule.createComputed(function(p1)
		-- upvalues: var15 (ref), var11 (ref), debugLuaAppEnableScale (copy), fIntLuaAppSmallScreenDesignWidthModule (copy), debugLuaAppEnableScale_1 (copy)
		local var24 = var15(p1)
		local var25 = var11(p1)
		
		return if var24 == nil or var25.X == 0 then 1 elseif debugLuaAppEnableScale_1 and (if var24 ~= Enum.DisplaySize.Small then debugLuaAppEnableScale else true) and fIntLuaAppSmallScreenDesignWidthModule < var25.X then var25.X / fIntLuaAppSmallScreenDesignWidthModule else 1
	end)
	local var24 = signalsModule.createComputed(function(p1)
		-- upvalues: var1 (copy), var23 (ref)
		return if var1 then 1.5 else var23(p1)
	end)
	
	return {
		getViewportSize = var11,
		getDisplaySize = var15,
		getGuiInset = var19,
		getTopBarHeight = var21,
		getUIScale = var23,
		getPlatformScale = var24,
		getDesignSpaceViewportWidth = signalsModule.createComputed(function(p1)
			-- upvalues: var11 (ref), var24 (ref)
			local var25 = var11(p1)
			local var26 = var24(p1)
			
			if not var26 or var26 == 0 then
				var26 = 1
			end
			return var25.X / var26
		end),
		getIsSpatial = var5,
		setGuiInset = var20,
		setTopBarHeight = var22,
		getDeviceSafePadding = var8,
		cleanUp = function()
			-- upvalues: var17 (write), var13 (write), var4 (write), var7 (write), var14 (ref)
			if var17 then
				var17:Disconnect()
				var17 = nil
			end
			if var13 then
				var13:Disconnect()
				var13 = nil
			end
			if var4 then
				var4:Disconnect()
				var4 = nil
			end
			if var7 then
				var7:Disconnect()
				var7 = nil
			end
			if var14 then
				var14()
			end
		end,
		forceConsoleSafeInsets = if fFlagDebugForceConsoleSafeInsets then function()
			-- upvalues: forceConsoleSafeInsets (copy), var11 (ref)
			forceConsoleSafeInsets(var11())
		end else nil
	}
end