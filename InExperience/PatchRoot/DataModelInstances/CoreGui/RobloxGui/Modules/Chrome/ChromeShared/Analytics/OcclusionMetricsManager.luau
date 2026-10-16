local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local ReactModule = require(CorePackages.Packages.React)
local SignalsModule = require(CorePackages.Packages.Signals)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ConstantsModule = require(script:FindFirstAncestor("ChromeShared").Unibar.Constants)
local CoreGuiCommonModule = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local FFlagTopBarSignalizeKeepOutAreas = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local FIntLuaUIOcclusionMetricsReportingPeriodSeconds = require(CorePackages.Workspace.Packages.SharedFlags).GetFIntLuaUIOcclusionMetricsReportingPeriodSeconds()
local GuiServiceSendUIOcclusionMetricsForQueryRegionEngineFeature = game:GetEngineFeature("GuiServiceSendUIOcclusionMetricsForQueryRegion")

local function _(p1) --[[ Line: 28 | Named "convertCoreUIPointToHardwareSafeAreaPoint" ]]
	-- upvalues: GuiService (copy)
	return p1 + GuiService:GetGuiInset()
end

local _ = function(Vector): UDim2 --[[ Line: 33 | Named "vector2ToUDim2" ]]
	return UDim2.fromOffset(Vector.X, Vector.Y)
end

local _ = function(p1) --[[ Line: 37 | Named "reportOcclusionMetrics" ]]
	-- upvalues: GuiService (copy)
	local NewPosition = p1.position + GuiService:GetGuiInset()
	local Size = p1.size
	GuiService:SendUIOcclusionMetricsForQueryRegion(UDim2.fromOffset(NewPosition.X, NewPosition.Y), UDim2.fromOffset(Size.X, Size.Y), "currentSizeTR")
end

return function() --[[ Line: 46 | Named "OcclusionMetricsManager" ]]
	-- upvalues: GuiServiceSendUIOcclusionMetricsForQueryRegionEngineFeature (copy), ReactModule (copy), ConstantsModule (copy), FFlagTopBarSignalizeKeepOutAreas (copy), CoreGuiCommonModule (copy), SignalsModule (copy), UseSelectorFunction (copy), GuiService (copy), FIntLuaUIOcclusionMetricsReportingPeriodSeconds (copy)
	if not GuiServiceSendUIOcclusionMetricsForQueryRegionEngineFeature then return end
	local Callback = nil
	local UseRefResult = ReactModule.useRef({
		id = ConstantsModule.UNIBAR_KEEP_OUT_AREA_ID,
		position = Vector2.new(),
		size = Vector2.new()
	})
	
	if FFlagTopBarSignalizeKeepOutAreas then
		local KeepOutAreasStore = CoreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
		Callback = SignalsModule.createEffect(function(_) --[[ Line: 63 ]]
			-- upvalues: UseRefResult (copy), KeepOutAreasStore (copy), ConstantsModule (upval)
			UseRefResult.current = KeepOutAreasStore.getKeepOutAreas(false)[ConstantsModule.UNIBAR_KEEP_OUT_AREA_ID]
		end)
	else
		local UseSelectorResult = UseSelectorFunction(function(p1) --[[ Line: 67 ]]
			-- upvalues: ConstantsModule (upval)
			return p1.displayOptions.keepOutAreas[ConstantsModule.UNIBAR_KEEP_OUT_AREA_ID]
		end)
		ReactModule.useEffect(function() --[[ Line: 71 ]]
			-- upvalues: UseRefResult (copy), UseSelectorResult (copy)
			UseRefResult.current = UseSelectorResult
		end, { UseSelectorResult })
	end
	ReactModule.useEffect(function() --[[ Line: 76 ]]
		-- upvalues: UseRefResult (copy), GuiService (upval), FIntLuaUIOcclusionMetricsReportingPeriodSeconds (upval), FFlagTopBarSignalizeKeepOutAreas (upval), Callback (ref)
		local SpawnedThread = task.spawn(function() --[[ Line: 78 ]]
			-- upvalues: UseRefResult (upval), GuiService (upval), FIntLuaUIOcclusionMetricsReportingPeriodSeconds (upval)
			while true do
				if UseRefResult.current then
					local Current = UseRefResult.current
					local NewPosition = Current.position + GuiService:GetGuiInset()
					local Size = Current.size
					GuiService:SendUIOcclusionMetricsForQueryRegion(UDim2.fromOffset(NewPosition.X, NewPosition.Y), UDim2.fromOffset(Size.X, Size.Y), "currentSizeTR")
				end
				task.wait(FIntLuaUIOcclusionMetricsReportingPeriodSeconds)
			end
		end)
		
		return function() --[[ Line: 87 ]]
			-- upvalues: SpawnedThread (copy), FFlagTopBarSignalizeKeepOutAreas (upval), Callback (upval)
			task.cancel(SpawnedThread)
			
			if FFlagTopBarSignalizeKeepOutAreas then
				Callback()
			end
		end
	end, {})
end