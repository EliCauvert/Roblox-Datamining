local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local reactModule = require(corePackagesService.Packages.React)
local signalsModule = require(corePackagesService.Packages.Signals)
local useSelector = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local constantsModule = require(chromeShared.Unibar.Constants)
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local fFlagTopBarSignalizeKeepOutAreas = coreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local fIntLuaUIOcclusionMetricsReportingPeriodSeconds = require(corePackagesService.Workspace.Packages.SharedFlags).GetFIntLuaUIOcclusionMetricsReportingPeriodSeconds()
local guiServiceSendUIOcclusionMetricsForQueryRegionEngineFeature = game:GetEngineFeature("GuiServiceSendUIOcclusionMetricsForQueryRegion")

local function _(p1)
	-- upvalues: guiService (ref)
	return p1 + guiService:GetGuiInset()
end

local _ = function(p1)
	return UDim2.fromOffset(p1.X, p1.Y)
end

local _ = function(p1)
	-- upvalues: guiService (ref)
	local var1 = p1.position + guiService:GetGuiInset()
	local size = p1.size
	guiService:SendUIOcclusionMetricsForQueryRegion(UDim2.fromOffset(var1.X, var1.Y), UDim2.fromOffset(size.X, size.Y), "currentSizeTR")
end

return function()
	-- upvalues: guiServiceSendUIOcclusionMetricsForQueryRegionEngineFeature (ref), reactModule (ref), constantsModule (ref), fFlagTopBarSignalizeKeepOutAreas (ref), coreGuiCommonModule (ref), signalsModule (ref), useSelector (ref), guiService (ref), fIntLuaUIOcclusionMetricsReportingPeriodSeconds (ref)
	if not guiServiceSendUIOcclusionMetricsForQueryRegionEngineFeature then return end
	local var1 = nil
	local var2 = reactModule.useRef({
		id = constantsModule.UNIBAR_KEEP_OUT_AREA_ID,
		position = Vector2.new(),
		size = Vector2.new()
	})
	
	if fFlagTopBarSignalizeKeepOutAreas then
		local keepOutAreasStore = coreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
		var1 = signalsModule.createEffect(function(_)
			-- upvalues: var2 (ref), keepOutAreasStore (ref), constantsModule (copy)
			var2.current = keepOutAreasStore.getKeepOutAreas(false)[constantsModule.UNIBAR_KEEP_OUT_AREA_ID]
		end)
	else
		local var3 = useSelector(function(p1)
			-- upvalues: constantsModule (copy)
			return p1.displayOptions.keepOutAreas[constantsModule.UNIBAR_KEEP_OUT_AREA_ID]
		end)
		reactModule.useEffect(function()
			-- upvalues: var2 (ref), var3 (ref)
			var2.current = var3
		end, { var3 })
	end
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), guiService (copy), fIntLuaUIOcclusionMetricsReportingPeriodSeconds (copy), fFlagTopBarSignalizeKeepOutAreas (copy), var1 (write)
		local thread = task.spawn(function()
			-- upvalues: var2 (copy), guiService (copy), fIntLuaUIOcclusionMetricsReportingPeriodSeconds (copy)
			while true do
				if var2.current then
					local current = var2.current
					local var4 = current.position + guiService:GetGuiInset()
					local size = current.size
					guiService:SendUIOcclusionMetricsForQueryRegion(UDim2.fromOffset(var4.X, var4.Y), UDim2.fromOffset(size.X, size.Y), "currentSizeTR")
				end
				task.wait(fIntLuaUIOcclusionMetricsReportingPeriodSeconds)
			end
		end)
		
		return function()
			-- upvalues: thread (ref), fFlagTopBarSignalizeKeepOutAreas (copy), var1 (copy)
			task.cancel(thread)
			
			if fFlagTopBarSignalizeKeepOutAreas then
				var1()
			end
		end
	end, {})
end