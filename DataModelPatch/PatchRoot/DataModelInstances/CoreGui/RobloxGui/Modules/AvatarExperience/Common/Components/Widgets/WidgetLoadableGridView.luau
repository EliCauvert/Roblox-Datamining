local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local WidgetEventImpressionsReporterModule = require(Modules.AvatarExperience.Common.Components.Impressions.WidgetEventImpressionsReporter)
local ScreenSizeImpressionsDetector = require(CorePackages.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local Grid = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).GridComponents.Grid
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local FFlagAXFixSeeAllSpacing = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixSeeAllSpacing
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local t = {}

return function(p1)
	-- upvalues: UseRoactServiceModule (copy), AnalyticsModule (copy), ReactModule (copy), Signal (copy), UseTokensFunction (copy), ScreenSizeImpressionsDetector (copy), t (copy), UnifiedEventLogEnums (copy), WidgetEventImpressionsReporterModule (copy), Grid (copy), FFlagAXFixSeeAllSpacing (copy)
	local WidgetInfo = p1.widgetInfo
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseRefResult = ReactModule.useRef(Signal.new())
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseTokensResult = UseTokensFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy)
		local Connection = if UseRefResult1.current then UseRefResult1.current:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current:fire()
		end) else nil
		UseRefResult.current:fire()
		
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, {})
	
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		GridView = ReactModule.createElement(Grid, {
			itemsPerRow = p1.itemsPerRow or 1,
			renderItem = function(p2)
				-- upvalues: p1 (copy)
				local Item = p2.item
				
				return p1.renderItem({
					id = Item.id,
					type = Item.type,
					gridInformation = p2.gridInformation
				}, p2.index)
			end,
			getItemId = function(p2): string
				-- upvalues: p1 (copy)
				return p2.id .. p1.itemsPerRow
			end,
			items = p1.items or {},
			gapVertical = if FFlagAXFixSeeAllSpacing then UseTokensResult.Gap.Medium else UseTokensResult.Gap.Large,
			gapHorizontal = if FFlagAXFixSeeAllSpacing then UseTokensResult.Gap.Medium else UseTokensResult.Gap.Small,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			ref = UseRefResult1
		}),
		ImpressionsDetector = ReactModule.createElement(ScreenSizeImpressionsDetector, {
			onRequestImpressionsSignal = UseRefResult.current,
			onImpressionsDetected = function(ItemPositions)
				-- upvalues: p1 (copy), t (upval), WidgetInfo (copy), UnifiedEventLogEnums (upval), WidgetEventImpressionsReporterModule (upval), UseRoactServiceModuleResult (copy)
				for _, itemPosition in ItemPositions do
					local Text = p1.widgetInfo.id .. "_" .. itemPosition
					
					if not t[Text] then
						local ContentEntry = WidgetInfo.content and WidgetInfo.content[itemPosition] or {}
						WidgetEventImpressionsReporterModule(UseRoactServiceModuleResult, {
							widgetId = p1.widgetInfo.id,
							itemPosition = itemPosition,
							itemId = ContentEntry.id,
							itemType = ContentEntry.type,
							uiTreatmentType = UnifiedEventLogEnums.WidgetUiTreatment.WIDGET_SEE_ALL
						})
						t[Text] = true
					end
				end
			end,
			impressionsTag = p1.impressionsTag
		})
	})
end