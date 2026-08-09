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
local fFlagLuaAppCompositionSupport = require(parent_1.SharedFlags).FFlagLuaAppCompositionSupport
local var9 = if fFlagLuaAppCompositionSupport then guiService:IsTenFootInterface() else nil

local function forceConsoleSafeInsets(value) --[[ line: 44 ]]
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

return function() --[[ line: 68 ]]
	-- upvalues: signalsModule (ref), appCommonLibModule (ref), guiService (ref), vrCompatibilityModule (ref), fFlagDebugForceConsoleSafeInsets (ref), forceConsoleSafeInsets (ref), enableDisplaySizeEngineFeature (ref), getGlobalGuiInsetModule (ref), debugLuaAppEnableScale (ref), fIntLuaAppSmallScreenDesignWidthModule (ref), debugLuaAppEnableScale_1 (ref), fFlagLuaAppCompositionSupport (ref), var9 (ref)
	local _ = nil
	local var12, var13 = signalsModule.createSignal(workspace.CurrentCamera)
	local var14 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ line: 71 ]]
		-- upvalues: var13 (ref)
		var13(workspace.CurrentCamera)
	end)
	local _ = nil
	local var15, var16 = signalsModule.createSignal(appCommonLibModule.isSpatial())
	local var17 = appCommonLibModule.connectToIsSpatialChanged(function(p0) --[[ line: 77 ]]
		-- upvalues: var16 (ref)
		var16(p0)
	end)
	
	local function calculateDeviceSafePadding() --[[ line: 81 ]]
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
	
	local var19, var20 = signalsModule.createSignal(calculateDeviceSafePadding())
	local vector2 = Vector2.new(1, 1)
	local var22 = var12(false)
	
	if var22 then
		vector2 = var22.ViewportSize
	end
	local var23, var24 = signalsModule.createSignal(vector2)
	local var25 = nil
	local var26 = signalsModule.createEffect(function(p1) --[[ line: 101 ]]
		-- upvalues: var12 (ref), var25 (write), var15 (ref), var24 (ref), vrCompatibilityModule (copy), var20 (ref), calculateDeviceSafePadding (ref), fFlagDebugForceConsoleSafeInsets (copy), forceConsoleSafeInsets (copy), var23 (ref)
		local var40 = var12(p1)
		
		if var40 then
			if var25 then
				var25:Disconnect()
				var25 = nil
			end
			if var15(p1) then
				var24(vrCompatibilityModule.VRConstants.MainScreenResolution)
				
				return
			end
			var25 = var40:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ line: 112 ]]
				-- upvalues: var24 (copy), var40 (ref), var20 (copy), calculateDeviceSafePadding (copy), fFlagDebugForceConsoleSafeInsets (copy), forceConsoleSafeInsets (copy), var23 (copy), p1 (ref)
				var24(var40.ViewportSize)
				var20(calculateDeviceSafePadding())
				
				if fFlagDebugForceConsoleSafeInsets then
					forceConsoleSafeInsets(var23(p1))
				end
			end)
		end
	end)
	local var27, var28 = signalsModule.createSignal(if enableDisplaySizeEngineFeature then guiService.ViewportDisplaySize else nil)
	local var29 = if enableDisplaySizeEngineFeature then guiService:GetPropertyChangedSignal("ViewportDisplaySize"):Connect(function() --[[ line: 131 ]]
		-- upvalues: var28 (ref), guiService (copy)
		var28(guiService.ViewportDisplaySize)
	end) else nil
	local var30 = getGlobalGuiInsetModule()
	local var31, var32 = signalsModule.createSignal(var30)
	local var33, var34 = signalsModule.createSignal(var30.top)
	local var35 = signalsModule.createComputed(function(p2) --[[ line: 140 ]]
		-- upvalues: var27 (ref), var23 (ref), debugLuaAppEnableScale (copy), fIntLuaAppSmallScreenDesignWidthModule (copy), debugLuaAppEnableScale_1 (copy)
		local var41 = var27(p2)
		local var42 = var23(p2)
		
		return if var41 == nil or var42.X == 0 then 1 elseif debugLuaAppEnableScale_1 and (if var41 ~= Enum.DisplaySize.Small then debugLuaAppEnableScale else true) and fIntLuaAppSmallScreenDesignWidthModule < var42.X then var42.X / fIntLuaAppSmallScreenDesignWidthModule else 1
	end)
	local var36 = nil
	local var37 = nil
	
	if fFlagLuaAppCompositionSupport then
		var36 = signalsModule.createComputed(function(p3) --[[ line: 160 ]]
			-- upvalues: var9 (copy), var35 (ref)
			return if var9 then 1.5 else var35(p3)
		end)
		var37 = signalsModule.createComputed(function(p4) --[[ line: 169 ]]
			-- upvalues: var23 (ref), var36 (write)
			local var43 = var23(p4)
			local var44 = var36(p4)
			
			if not var44 or var44 == 0 then
				var44 = 1
			end
			return var43.X / var44
		end)
	end
	return {
		getViewportSize = var23,
		getDisplaySize = var27,
		getGuiInset = var31,
		getTopBarHeight = var33,
		getUIScale = var35,
		getPlatformScale = if fFlagLuaAppCompositionSupport then var36 else nil,
		getDesignSpaceViewportWidth = if fFlagLuaAppCompositionSupport then var37 else nil,
		getIsSpatial = var15,
		setGuiInset = var32,
		setTopBarHeight = var34,
		getDeviceSafePadding = var19,
		cleanUp = function() --[[ line: 193 ]]
			-- upvalues: var29 (write), var25 (write), var14 (write), var17 (write), var26 (ref)
			if var29 then
				var29:Disconnect()
				var29 = nil
			end
			if var25 then
				var25:Disconnect()
				var25 = nil
			end
			if var14 then
				var14:Disconnect()
				var14 = nil
			end
			if var17 then
				var17:Disconnect()
				var17 = nil
			end
			if var26 then
				var26()
			end
		end,
		forceConsoleSafeInsets = if fFlagDebugForceConsoleSafeInsets then function() --[[ line: 215 ]]
			-- upvalues: forceConsoleSafeInsets (copy), var23 (ref)
			forceConsoleSafeInsets(var23())
		end else nil
	}
end