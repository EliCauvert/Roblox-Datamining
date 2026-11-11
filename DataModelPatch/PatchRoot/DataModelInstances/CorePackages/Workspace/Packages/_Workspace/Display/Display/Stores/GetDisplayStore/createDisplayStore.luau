local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local SignalsModule = require(Parent1.Signals)
local AppCommonLibModule = require(Parent1.AppCommonLib)
local VrCompatibilityModule = require(Parent1.VrCompatibility)
local GetGlobalGuiInsetModule = require(Parent.getGlobalGuiInset)
local FIntLuaAppSmallScreenDesignWidthModule = require(Parent.Flags.FIntLuaAppSmallScreenDesignWidth)
local EnableDisplaySizeEngineFeature = game:GetEngineFeature("EnableDisplaySize")
local FFlagLuaAppEnableWindowsHandheldScale = game:DefineFastFlag("FFlagLuaAppEnableWindowsHandheldScale", false)
local DebugLuaAppEnableScale = game:DefineFastFlag("DebugLuaAppEnableScale", false)
local DebugLuaAppEnableScale1 = DebugLuaAppEnableScale or FFlagLuaAppEnableWindowsHandheldScale and EnableDisplaySizeEngineFeature
local FFlagDebugForceConsoleSafeInsets = require(Parent1.SharedFlags).FFlagDebugForceConsoleSafeInsets
local IsTenFootInterface = GuiService:IsTenFootInterface()

local function forceConsoleSafeInsets(Vector)
	-- upvalues: Parent1 (copy)
	local MessageBus = require(Parent1.MessageBus).MessageBus
	local TModule = require(Parent1.t)
	MessageBus.publish({
		mid = MessageBus.getMessageId("Screen", "safeAreaInsets"),
		validateParams = TModule.strictInterface({
			left = TModule.number,
			top = TModule.number,
			right = TModule.number,
			bottom = TModule.number
		})
	}, {
		left = Vector.X * 0.05 / 1.5,
		top = Vector.Y * 0.05 / 1.5,
		right = Vector.X * 0.05 / 1.5,
		bottom = Vector.Y * 0.05 / 1.5
	})
end

return function()
	-- upvalues: SignalsModule (copy), AppCommonLibModule (copy), GuiService (copy), VrCompatibilityModule (copy), FFlagDebugForceConsoleSafeInsets (copy), forceConsoleSafeInsets (copy), EnableDisplaySizeEngineFeature (copy), GetGlobalGuiInsetModule (copy), DebugLuaAppEnableScale (copy), FIntLuaAppSmallScreenDesignWidthModule (copy), DebugLuaAppEnableScale1 (copy), IsTenFootInterface (copy)
	local Connection = nil
	local Signal, Signal2 = SignalsModule.createSignal(workspace.CurrentCamera)
	Connection = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		-- upvalues: Signal2 (copy)
		Signal2(workspace.CurrentCamera)
	end)
	local ConnectToIsSpatialChangedResult = nil
	local Signal1, Signal2_1 = SignalsModule.createSignal(AppCommonLibModule.isSpatial())
	ConnectToIsSpatialChangedResult = AppCommonLibModule.connectToIsSpatialChanged(function(p1)
		-- upvalues: Signal2_1 (copy)
		Signal2_1(p1)
	end)
	
	local function calculateDeviceSafePadding()
		-- upvalues: GuiService (upval)
		local InsetArea = GuiService:GetInsetArea(Enum.ScreenInsets.None)
		local InsetArea1 = GuiService:GetInsetArea(Enum.ScreenInsets.DeviceSafeInsets)
		
		return {
			left = InsetArea1.Min.X - InsetArea.Min.X,
			top = InsetArea1.Min.Y - InsetArea.Min.Y,
			right = InsetArea.Max.X - InsetArea1.Max.X,
			bottom = InsetArea.Max.Y - InsetArea1.Max.Y
		}
	end
	
	local Signal3, Signal2_2 = SignalsModule.createSignal((calculateDeviceSafePadding()))
	local _Vector2 = Vector2.new(1, 1)
	local SignalResult = Signal(false)
	
	if SignalResult then
		_Vector2 = SignalResult.ViewportSize
	end
	local Signal4, Signal2_3 = SignalsModule.createSignal(_Vector2)
	local Connection1 = nil
	local Effect = SignalsModule.createEffect(function(p1)
		-- upvalues: Signal (copy), Connection1 (ref), Signal1 (copy), Signal2_3 (copy), VrCompatibilityModule (upval), Signal2_2 (copy), calculateDeviceSafePadding (copy), FFlagDebugForceConsoleSafeInsets (upval), forceConsoleSafeInsets (upval), Signal4 (copy)
		local SignalResult = Signal(p1)
		
		if SignalResult then
			if Connection1 then
				Connection1:Disconnect()
				Connection1 = nil
			end
			if Signal1(p1) then
				Signal2_3(VrCompatibilityModule.VRConstants.MainScreenResolution)
				
				return
			end
			Connection1 = SignalResult:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				-- upvalues: Signal2_3 (upval), SignalResult (copy), Signal2_2 (upval), calculateDeviceSafePadding (upval), FFlagDebugForceConsoleSafeInsets (upval), forceConsoleSafeInsets (upval), Signal4 (upval), p1 (copy)
				Signal2_3(SignalResult.ViewportSize)
				Signal2_2((calculateDeviceSafePadding()))
				
				if FFlagDebugForceConsoleSafeInsets then
					forceConsoleSafeInsets(Signal4(p1))
				end
			end)
		end
	end)
	local Signal5, Signal2_4 = SignalsModule.createSignal(if EnableDisplaySizeEngineFeature then GuiService.ViewportDisplaySize else nil)
	local Connection2 = if EnableDisplaySizeEngineFeature then GuiService:GetPropertyChangedSignal("ViewportDisplaySize"):Connect(function()
		-- upvalues: Signal2_4 (copy), GuiService (upval)
		Signal2_4(GuiService.ViewportDisplaySize)
	end) else nil
	local GlobalGuiInsetModule = GetGlobalGuiInsetModule()
	local Signal6, Signal2_5 = SignalsModule.createSignal(GlobalGuiInsetModule)
	local Signal7, Signal2_6 = SignalsModule.createSignal(GlobalGuiInsetModule.top)
	local Computed = SignalsModule.createComputed(function(p1)
		-- upvalues: Signal5 (copy), Signal4 (copy), DebugLuaAppEnableScale (upval), FIntLuaAppSmallScreenDesignWidthModule (upval), DebugLuaAppEnableScale1 (upval)
		local SignalResult = Signal5(p1)
		local SignalResult1 = Signal4(p1)
		
		if SignalResult == nil or SignalResult1.X == 0 then
			return 1
		else
			local IsSignalResultMatch = SignalResult == Enum.DisplaySize.Small or DebugLuaAppEnableScale
			local IsXAbove = SignalResult1.X > FIntLuaAppSmallScreenDesignWidthModule
			
			return if DebugLuaAppEnableScale1 and IsSignalResultMatch and IsXAbove then SignalResult1.X / FIntLuaAppSmallScreenDesignWidthModule else 1
		end
	end)
	local Computed1 = SignalsModule.createComputed(function(p1)
		-- upvalues: IsTenFootInterface (upval), Computed (copy)
		return if IsTenFootInterface then 1.5 else Computed(p1)
	end)
	
	return {
		getViewportSize = Signal4,
		getDisplaySize = Signal5,
		getGuiInset = Signal6,
		getTopBarHeight = Signal7,
		getUIScale = Computed,
		getPlatformScale = Computed1,
		getDesignSpaceViewportWidth = SignalsModule.createComputed(function(p1)
			-- upvalues: Signal4 (copy), Computed1 (copy)
			local SignalResult = Signal4(p1)
			local ComputedResult = Computed1(p1)
			
			if not ComputedResult or ComputedResult == 0 then
				ComputedResult = 1
			end
			return SignalResult.X / ComputedResult
		end),
		getIsSpatial = Signal1,
		setGuiInset = Signal2_5,
		setTopBarHeight = Signal2_6,
		getDeviceSafePadding = Signal3,
		cleanUp = function()
			-- upvalues: Connection2 (ref), Connection1 (ref), Connection (ref), ConnectToIsSpatialChangedResult (ref), Effect (copy)
			if Connection2 then
				Connection2:Disconnect()
				Connection2 = nil
			end
			if Connection1 then
				Connection1:Disconnect()
				Connection1 = nil
			end
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
			if ConnectToIsSpatialChangedResult then
				ConnectToIsSpatialChangedResult:Disconnect()
				ConnectToIsSpatialChangedResult = nil
			end
			if Effect then
				Effect()
			end
		end,
		forceConsoleSafeInsets = if FFlagDebugForceConsoleSafeInsets then function()
			-- upvalues: forceConsoleSafeInsets (upval), Signal4 (copy)
			forceConsoleSafeInsets(Signal4())
		end else nil
	}
end