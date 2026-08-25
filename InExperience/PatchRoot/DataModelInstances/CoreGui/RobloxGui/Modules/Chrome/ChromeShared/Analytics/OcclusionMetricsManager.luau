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

local function _(p0)
	-- upvalues: guiService (ref)
	return p0 + guiService:GetGuiInset()
end

local _ = function(p1)
	return UDim2.fromOffset(p1.X, p1.Y)
end

local _ = function(p2)
	-- upvalues: guiService (ref)
	local var9 = p2.position + guiService:GetGuiInset()
	local size = p2.size
	guiService:SendUIOcclusionMetricsForQueryRegion(UDim2.fromOffset(var9.X, var9.Y), UDim2.fromOffset(size.X, size.Y), "currentSizeTR")
end

return function()
	-- upvalues: guiServiceSendUIOcclusionMetricsForQueryRegionEngineFeature (ref), reactModule (ref), constantsModule (ref), fFlagTopBarSignalizeKeepOutAreas (ref), coreGuiCommonModule (ref), signalsModule (ref), useSelector (ref), guiService (ref), fIntLuaUIOcclusionMetricsReportingPeriodSeconds (ref)
	if not guiServiceSendUIOcclusionMetricsForQueryRegionEngineFeature then return end
	local var10 = nil
	local var11 = reactModule.useRef({
		id = constantsModule.UNIBAR_KEEP_OUT_AREA_ID,
		position = Vector2.new(),
		size = Vector2.new()
	})
	
	if fFlagTopBarSignalizeKeepOutAreas then
		local keepOutAreasStore = coreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
		var10 = signalsModule.createEffect(function(_)
			-- upvalues: var11 (ref), keepOutAreasStore (ref), constantsModule (copy)
			var11.current = keepOutAreasStore.getKeepOutAreas(false)[constantsModule.UNIBAR_KEEP_OUT_AREA_ID]
		end)
	else
		local var13 = useSelector(function(p3)
			-- upvalues: constantsModule (copy)
			return p3.displayOptions.keepOutAreas[constantsModule.UNIBAR_KEEP_OUT_AREA_ID]
		end)
		reactModule.useEffect(function()
			-- upvalues: var11 (ref), var13 (ref)
			var11.current = var13
		end, { var13 })
	end
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), guiService (copy), fIntLuaUIOcclusionMetricsReportingPeriodSeconds (copy), fFlagTopBarSignalizeKeepOutAreas (copy), var10 (write)
		local thread = task.spawn(function()
			-- upvalues: var11 (copy), guiService (copy), fIntLuaUIOcclusionMetricsReportingPeriodSeconds (copy)
			while true do
				if var11.current then
					local current = var11.current
					local var15 = current.position + guiService:GetGuiInset()
					local size = current.size
					guiService:SendUIOcclusionMetricsForQueryRegion(UDim2.fromOffset(var15.X, var15.Y), UDim2.fromOffset(size.X, size.Y), "currentSizeTR")
				end
				task.wait(fIntLuaUIOcclusionMetricsReportingPeriodSeconds)
			end
		end)
		
		return function()
			-- upvalues: thread (ref), fFlagTopBarSignalizeKeepOutAreas (copy), var10 (copy)
			task.cancel(thread)
			
			if fFlagTopBarSignalizeKeepOutAreas then
				var10()
			end
		end
	end, {})
end