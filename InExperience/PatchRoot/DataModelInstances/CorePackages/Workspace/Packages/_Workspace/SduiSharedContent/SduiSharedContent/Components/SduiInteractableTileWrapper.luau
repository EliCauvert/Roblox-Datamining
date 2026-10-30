local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SduiTileOverflowMenuModule = require(SduiSharedContent.Components.SduiTileOverflowMenu)
local GetOverflowMenuSignalStoreFunction = require(Parent.AppBlox).getOverflowMenuSignalStore
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseUidRefStringFunction = require(Parent.SduiCoreSystem).useUidRefString

local function InteractableTileWrapperMenu(p1)
	-- upvalues: UseSignalStateFunction (copy), ReactModule (copy), SduiTileOverflowMenuModule (copy)
	return ReactModule.createElement(SduiTileOverflowMenuModule, {
		debugName = "SduiInteractableTileWrapper.OverflowMenu",
		zIndex = 5,
		componentConfig = p1.componentConfig,
		isHovered = UseSignalStateFunction(p1.getIsHovered),
		isSelected = UseSignalStateFunction(p1.getIsSelected),
		menuKey = p1.menuKey,
		parentRef = p1.parentRef,
		sduiContext = p1.sduiContext
	})
end

local function useTileMenu(SduiContext)
	-- upvalues: UseUidRefStringFunction (copy), ReactModule (copy), SignalsModule (copy), GetOverflowMenuSignalStoreFunction (copy)
	local InteractableName: string = `sdui-interactable-tile-wrapper-{UseUidRefStringFunction().current}`
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(false)
		local Signal1, Signal2_1 = SignalsModule.createSignal(false)
		
		return {
			getIsHovered = Signal,
			setIsHovered = Signal2,
			getIsSelected = Signal1,
			setIsSelected = Signal2_1
		}
	end, {})
	local TriggerFeedbackFunction = SduiContext.dependencies.triggerFeedback
	local AppPage = SduiContext.appPage
	
	return ReactModule.useMemo(function()
		-- upvalues: InteractableName (copy), UseRefResult (copy), UseMemoResult (copy), GetOverflowMenuSignalStoreFunction (upval), TriggerFeedbackFunction (copy), AppPage (copy)
		return {
			menuKey = InteractableName,
			tileRef = UseRefResult,
			getIsHovered = UseMemoResult.getIsHovered,
			getIsSelected = UseMemoResult.getIsSelected,
			tileHandlers = {
				setGuiObject = function(Current)
					-- upvalues: UseRefResult (upval)
					UseRefResult.current = Current
				end,
				onMouseEnter = function()
					-- upvalues: UseMemoResult (upval)
					UseMemoResult.setIsHovered(true)
				end,
				onMouseLeave = function()
					-- upvalues: UseMemoResult (upval)
					UseMemoResult.setIsHovered(false)
				end,
				onSelectionGained = function()
					-- upvalues: UseMemoResult (upval)
					UseMemoResult.setIsSelected(true)
				end,
				onSelectionLost = function()
					-- upvalues: UseMemoResult (upval)
					UseMemoResult.setIsSelected(false)
				end,
				onTouchLongPress = function()
					-- upvalues: GetOverflowMenuSignalStoreFunction (upval), TriggerFeedbackFunction (upval), InteractableName (upval), AppPage (upval)
					local OverflowMenuSignalStore = GetOverflowMenuSignalStoreFunction()
					
					if TriggerFeedbackFunction and not OverflowMenuSignalStore.getIsMenuOpen(InteractableName) then
						TriggerFeedbackFunction("TileLongPress", "Press", AppPage or "Unknown")
					end
					OverflowMenuSignalStore.openMenu(InteractableName)
				end
			}
		}
	end, {
		InteractableName,
		UseMemoResult,
		TriggerFeedbackFunction,
		AppPage
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: useTileMenu (copy), ReactModule (copy), InteractableTileWrapperMenu (copy), CryoModule (copy)
	local UseTileMenuResult = useTileMenu(p1.sduiContext)
	local OverflowMenuComponent = p1.overflowMenuComponent
	local SduiContext = p1.sduiContext
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: OverflowMenuComponent (copy), ReactModule (upval), InteractableTileWrapperMenu (upval), SduiContext (copy), UseTileMenuResult (copy)
		return if OverflowMenuComponent then ReactModule.createElement(InteractableTileWrapperMenu, {
			sduiContext = SduiContext,
			componentConfig = OverflowMenuComponent,
			menuKey = UseTileMenuResult.menuKey,
			parentRef = UseTileMenuResult.tileRef,
			getIsHovered = UseTileMenuResult.getIsHovered,
			getIsSelected = UseTileMenuResult.getIsSelected
		}) else nil
	end, { OverflowMenuComponent, SduiContext, UseTileMenuResult })
	local TileComponent = p1.tileComponent
	
	if not TileComponent then
		return nil
	end
	local JoinResult = {
		size = p1.size,
		layoutOrder = p1.layoutOrder,
		selectionOrder = p1.selectionOrder
	}
	
	if UseMemoResult then
		JoinResult = CryoModule.Dictionary.join(JoinResult, UseTileMenuResult.tileHandlers, { thumbnailOverflowMenuComponent = UseMemoResult })
	end
	return ReactModule.cloneElement(TileComponent, {
		parentAnalyticsContext = p1.analyticsContext,
		extraLocalProps = JoinResult
	})
end)