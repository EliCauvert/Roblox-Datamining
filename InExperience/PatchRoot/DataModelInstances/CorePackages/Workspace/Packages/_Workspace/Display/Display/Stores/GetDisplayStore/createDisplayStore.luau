local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local appCommonLibModule = require(parent_1.AppCommonLib)
local vrCompatibilityModule = require(parent_1.VrCompatibility)
local getGlobalGuiInsetModule = require(parent.getGlobalGuiInset)
local fIntLuaAppSmallScreenDesignWidthModule = require(parent.Flags.FIntLuaAppSmallScreenDesignWidth)
local fFlagDisableLuaAppConsoleScaleModule = require(parent.Flags.FFlagDisableLuaAppConsoleScale)
local enableDisplaySizeEngineFeature = game:GetEngineFeature("EnableDisplaySize")
local debugLuaAppEnableScale = game:DefineFastFlag("DebugLuaAppEnableScale", false)
local debugLuaAppEnableScale_1 = debugLuaAppEnableScale or game:DefineFastFlag("FFlagLuaAppEnableWindowsHandheldScale", false) and enableDisplaySizeEngineFeature
local fFlagDebugForceConsoleSafeInsets = require(parent_1.SharedFlags).FFlagDebugForceConsoleSafeInsets
local var1 = if fFlagDisableLuaAppConsoleScaleModule then 1 else 1.5
local var2 = guiService:IsTenFootInterface()

local function forceConsoleSafeInsets(value)
	-- upvalues: parent_1 (ref), var1 (ref)
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
		left = value.X * 0.05 / var1,
		top = value.Y * 0.05 / var1,
		right = value.X * 0.05 / var1,
		bottom = value.Y * 0.05 / var1
	})
end

return function()
	-- upvalues: signalsModule (ref), appCommonLibModule (ref), guiService (ref), vrCompatibilityModule (ref), fFlagDebugForceConsoleSafeInsets (ref), forceConsoleSafeInsets (ref), enableDisplaySizeEngineFeature (ref), getGlobalGuiInsetModule (ref), debugLuaAppEnableScale (ref), fIntLuaAppSmallScreenDesignWidthModule (ref), debugLuaAppEnableScale_1 (ref), var2 (ref), var1 (ref)
	local _ = nil
	local var3, var4 = signalsModule.createSignal(workspace.CurrentCamera)
	local var5 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		-- upvalues: var4 (ref)
		var4(workspace.CurrentCamera)
	end)
	local _ = nil
	local var6, var7 = signalsModule.createSignal(appCommonLibModule.isSpatial())
	local var8 = appCommonLibModule.connectToIsSpatialChanged(function(p1)
		-- upvalues: var7 (ref)
		var7(p1)
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
	
	local var9, var10 = signalsModule.createSignal(calculateDeviceSafePadding())
	local vector2 = Vector2.new(1, 1)
	local var11 = var3(false)
	
	if var11 then
		vector2 = var11.ViewportSize
	end
	local var12, var13 = signalsModule.createSignal(vector2)
	local var14 = nil
	local var15 = signalsModule.createEffect(function(p1)
		-- upvalues: var3 (ref), var14 (write), var6 (ref), var13 (ref), vrCompatibilityModule (copy), var10 (ref), calculateDeviceSafePadding (ref), fFlagDebugForceConsoleSafeInsets (copy), forceConsoleSafeInsets (copy), var12 (ref)
		local var16 = var3(p1)
		
		if var16 then
			if var14 then
				var14:Disconnect()
				var14 = nil
			end
			if var6(p1) then
				var13(vrCompatibilityModule.VRConstants.MainScreenResolution)
				
				return
			end
			var14 = var16:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				-- upvalues: var13 (copy), var16 (ref), var10 (copy), calculateDeviceSafePadding (copy), fFlagDebugForceConsoleSafeInsets (copy), forceConsoleSafeInsets (copy), var12 (copy), p1 (ref)
				var13(var16.ViewportSize)
				var10(calculateDeviceSafePadding())
				
				if fFlagDebugForceConsoleSafeInsets then
					forceConsoleSafeInsets(var12(p1))
				end
			end)
		end
	end)
	local var16, var17 = signalsModule.createSignal(if enableDisplaySizeEngineFeature then guiService.ViewportDisplaySize else nil)
	local var18 = if enableDisplaySizeEngineFeature then guiService:GetPropertyChangedSignal("ViewportDisplaySize"):Connect(function()
		-- upvalues: var17 (ref), guiService (copy)
		var17(guiService.ViewportDisplaySize)
	end) else nil
	local var19 = getGlobalGuiInsetModule()
	local var20, var21 = signalsModule.createSignal(var19)
	local var22, var23 = signalsModule.createSignal(var19.top)
	local var24 = signalsModule.createComputed(function(p1)
		-- upvalues: var16 (ref), var12 (ref), debugLuaAppEnableScale (copy), fIntLuaAppSmallScreenDesignWidthModule (copy), debugLuaAppEnableScale_1 (copy)
		local var25 = var16(p1)
		local var26 = var12(p1)
		
		return if var25 == nil or var26.X == 0 then 1 elseif debugLuaAppEnableScale_1 and (if var25 ~= Enum.DisplaySize.Small then debugLuaAppEnableScale else true) and fIntLuaAppSmallScreenDesignWidthModule < var26.X then var26.X / fIntLuaAppSmallScreenDesignWidthModule else 1
	end)
	local var25 = signalsModule.createComputed(function(p1)
		-- upvalues: var2 (copy), var1 (copy), var24 (ref)
		return if var2 then var1 else var24(p1)
	end)
	
	return {
		getViewportSize = var12,
		getDisplaySize = var16,
		getGuiInset = var20,
		getTopBarHeight = var22,
		getUIScale = var24,
		getPlatformScale = var25,
		getDesignSpaceViewportWidth = signalsModule.createComputed(function(p1)
			-- upvalues: var12 (ref), var25 (ref)
			local var26 = var12(p1)
			local var27 = var25(p1)
			
			if not var27 or var27 == 0 then
				var27 = 1
			end
			return var26.X / var27
		end),
		getIsSpatial = var6,
		setGuiInset = var21,
		setTopBarHeight = var23,
		getDeviceSafePadding = var9,
		cleanUp = function()
			-- upvalues: var18 (write), var14 (write), var5 (write), var8 (write), var15 (ref)
			if var18 then
				var18:Disconnect()
				var18 = nil
			end
			if var14 then
				var14:Disconnect()
				var14 = nil
			end
			if var5 then
				var5:Disconnect()
				var5 = nil
			end
			if var8 then
				var8:Disconnect()
				var8 = nil
			end
			if var15 then
				var15()
			end
		end,
		forceConsoleSafeInsets = if fFlagDebugForceConsoleSafeInsets then function()
			-- upvalues: forceConsoleSafeInsets (copy), var12 (ref)
			forceConsoleSafeInsets(var12())
		end else nil
	}
end