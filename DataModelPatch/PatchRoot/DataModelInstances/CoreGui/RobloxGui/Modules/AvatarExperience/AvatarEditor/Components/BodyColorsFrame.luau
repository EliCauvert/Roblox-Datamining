local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(Modules.AvatarExperience.Common.Types)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local SelectAvatarPreviewColors = if AvatarExperienceFlagsModule.FFlagAXColorAdjustmentButtonShouldAccountForTryOns then AvatarExperienceCommonModule.State.Selectors.selectAvatarPreviewColors else require(Modules.AvatarExperience.Common.Selectors.selectAvatarPreviewColors)
local BodyColorButtonModule = require(Modules.AvatarExperience.AvatarEditor.Components.BodyColorButton)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local UtilsModule1 = require(Modules.AvatarExperience.AvatarEditor.Utils)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local RadioButtonList = UIBloxModule.App.InputButton.RadioButtonList
local DefaultMetricsGridView = UIBloxModule.App.Grid.DefaultMetricsGridView
local BodyColorsSliderFrameModule = require(Modules.AvatarExperience.AvatarEditor.Components.BodyColorsSliderFrame)
local SetBodyColorViewSettingModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetBodyColorViewSetting)
local SetBodyPartRangeIdsModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetBodyPartRangeIds)
local SetSelectedBodyPartIndexModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetSelectedBodyPartIndex)
local SelectRangeIdForSelectedBodyPartsModule = require(Modules.AvatarExperience.AvatarEditor.Selectors.selectRangeIdForSelectedBodyParts)
local WithAdaptiveScrollingFunction = AvatarExperienceCommonModule.Hooks.withAdaptiveScrolling
local FFlagAXFixColorAdjustmentGamepadSupportModule = require(Modules.AvatarExperience.Flags.FFlagAXFixColorAdjustmentGamepadSupport)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXAdaptiveScrollingFixForward = AvatarExperienceFlagsModule.FFlagAXAdaptiveScrollingFixForward
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local BodyColorsFrame = RoactModule.PureComponent:extend("BodyColorsFrame")
local Buffer = table.create(ConstantsModule.ShimmerColorCardsToDisplay, {})
local config = { minimumItemsPerRow = 5, minimumItemWidth = 60 }
BodyColorsFrame.validateProps = TModule.strictInterface({
	Size = TModule.UDim2,
	NextSelectionUp = TModule.optional(TModule.table),
	viewSetting = TModule.string,
	rangeIdForSelectedBodyParts = TModule.optional(TModule.string),
	defaultBodyColorRanges = TModule.table,
	bodyColor3s = TModule.table,
	bodyPartRangeIds = TModule.table,
	selectedBodyPartIndex = TModule.number,
	setViewSetting = TModule.callback,
	setBodyPartRangeIds = TModule.callback,
	setSelectedBodyPartIndex = TModule.callback,
	adaptiveScrolling = TModule.optional(TModule.any),
	onContentScroll = if GetFFlagAXEnableSlotBasedEditorModule() then TModule.optional(TModule.any) else nil,
	LayoutOrder = TModule.optional(TModule.number),
	PaddingBottom = TModule.optional(TModule.UDim),
	PaddingTop = TModule.optional(TModule.UDim),
	PaddingLeft = TModule.optional(TModule.UDim),
	PaddingRight = TModule.optional(TModule.UDim),
	ref = if FFlagAXFixColorAdjustmentGamepadSupportModule then TModule.optional(TModule.table) else nil
})

function BodyColorsFrame.init(p1)
	-- upvalues: RoactModule (copy), BodyColorButtonModule (copy), ConstantsModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy)
	p1:setState({ bodyColorsFrameHeight = 0, bodyPartsListHeight = 0 })
	
	function p1.renderItem(p2)
		-- upvalues: RoactModule (upval), BodyColorButtonModule (upval), p1 (copy)
		return if p2.rangeId then RoactModule.createElement(BodyColorButtonModule, { rangeId = p2.rangeId }) else p1:getShimmerPanel()
	end
	
	function p1.onScroll(p2)
		-- upvalues: p1 (copy)
		if p1.props.adaptiveScrolling then
			p1.props.adaptiveScrolling.onCanvasPositionChanged(p2)
		end
		if p1.props.onContentScroll then
			p1.props.onContentScroll(p2)
		end
	end
	
	p1.canvasSizeBinding, p1.updateCanvasSizeBinding = RoactModule.createBinding(UDim2.new(0, 0, 1, 0))
	p1.bodyPartsListHeightBinding, p1.updateBodyPartsListHeightBinding = RoactModule.createBinding(0)
	p1.bodyColorsFrameHeightBinding, p1.updateBodyColorsFrameHeightBinding = RoactModule.createBinding(0)
	
	function p1.onUIListLayoutContentSizeChanged(p2)
		-- upvalues: ConstantsModule (upval), p1 (copy)
		p1.updateCanvasSizeBinding(UDim2.new(0, 0, 0, p2.AbsoluteContentSize.Y + ConstantsModule.SkinColorGridPadding * 2))
	end
	
	function p1.onBodyPartsListAbsoluteSizeChanged(Frame)
		-- upvalues: p1 (copy)
		p1.updateBodyPartsListHeightBinding(Frame.AbsoluteSize.Y)
	end
	
	function p1.onBodyColorsFrameAbsoluteSizeChanged(Frame)
		-- upvalues: p1 (copy)
		p1.updateBodyColorsFrameHeightBinding(Frame.AbsoluteSize.Y)
	end
	
	p1.toggleViewButtonRef = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createRef()
	p1.bodyColorButtonsRef = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createRef()
	p1.bodyPartButtonsRef = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createRef()
	p1.sliderRef = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createRef()
	p1:setSelectedBodyPartIndex(1)
end

function BodyColorsFrame.setSelectedBodyPartIndex(p1, p2)
	p1.props.setSelectedBodyPartIndex(p2)
end

function BodyColorsFrame:getShimmerPanel()
	-- upvalues: RoactModule (copy), Skeleton (copy)
	return RoactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 1, 0) })
end

function BodyColorsFrame.getItems(p1)
	-- upvalues: Buffer (copy)
	local DefaultBodyColorRanges = p1.props.defaultBodyColorRanges
	
	return DefaultBodyColorRanges and #DefaultBodyColorRanges > 0 and DefaultBodyColorRanges or Buffer
end

function BodyColorsFrame.getBodyPartsListHeight(p1)
	-- upvalues: ConstantsModule (copy)
	return if p1.props.viewSetting == ConstantsModule.ColorPickerViewSettings.AdvancedView then p1.state.bodyPartsListHeight else 0
end

function BodyColorsFrame.getGridAndSidebarFrameSize(p1)
	-- upvalues: RoactModule (copy), ConstantsModule (copy), UtilsModule1 (copy)
	return if p1:shouldRenderSliderBar() then RoactModule.joinBindings({
		p1.canvasSizeBinding,
		p1.bodyPartsListHeightBinding,
		p1.bodyColorsFrameHeightBinding
	}):map(function(Entry): UDim2
		-- upvalues: p1 (copy), ConstantsModule (upval), UtilsModule1 (upval)
		local Offset = Entry[1].Y.Offset
		local Entry1 = Entry[2]
		local Entry2 = Entry[3]
		
		if p1.props.viewSetting ~= ConstantsModule.ColorPickerViewSettings.AdvancedView then
			Entry1 = 0
		end
		return UDim2.new(1, 0, 1, -UtilsModule1.getBodyColorsSliderFrameHeight(ConstantsModule.BodyColorsSliderFrameHeight, Offset, Entry2, Entry1))
	end) else p1.props.Size
end

function BodyColorsFrame.renderBodyColorButtons(p1, Items, BodyPartButtonsRef)
	-- upvalues: RoactModule (copy), DefaultMetricsGridView (copy), UtilsModule (copy), ConstantsModule1 (copy), GridMetrics (copy), config (copy), FFlagAXMigrateAXToGlobalAutofocus (copy)
	return RoactModule.createElement(DefaultMetricsGridView, {
		renderItem = p1.renderItem,
		getItemHeight = UtilsModule.GridItemHeightGetter(ConstantsModule1.ItemTileType.BodyColorButton),
		getItemMetrics = GridMetrics.makeCustomMetricsGetter(config),
		itemPadding = Vector2.new(10, 10),
		items = Items,
		maxHeight = 1e999,
		defaultChildIndex = 1,
		NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.toggleViewButtonRef,
		NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.NextSelectionUp,
		NextSelectionLeft = if FFlagAXMigrateAXToGlobalAutofocus then nil else BodyPartButtonsRef,
		[RoactModule.Ref] = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.bodyColorButtonsRef
	})
end

function BodyColorsFrame.renderToggleButton(p1, Text, p2, Callback, p3)
	-- upvalues: RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), CursorKind (copy)
	return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "TextButton" else Focusable.TextButton, {
		AnchorPoint = Vector2.new(1, 0),
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Position = UDim2.fromScale(1, 0),
		Size = UDim2.new(0, 100, 0, 30),
		Text = Text,
		Font = p2.Font.Header2.Font,
		AutomaticSize = Enum.AutomaticSize.X,
		TextSize = p2.Font.BaseSize * p2.Font.Header2.RelativeSize,
		TextColor3 = p2.Theme.TextEmphasis.Color,
		NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.bodyColorButtonsRef,
		NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.sliderRef,
		SelectionImageObject = Callback(CursorKind.RoundedRect),
		[RoactModule.Ref] = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.toggleViewButtonRef,
		[RoactModule.Event.Activated] = p3
	})
end

function BodyColorsFrame.renderUIListLayout(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 20),
		[RoactModule.Change.AbsoluteContentSize] = p1.onUIListLayoutContentSizeChanged
	})
end

function BodyColorsFrame.renderUIPadding(p1)
	-- upvalues: RoactModule (copy), ConstantsModule (copy)
	return RoactModule.createElement("UIPadding", {
		PaddingTop = if p1.props.PaddingTop then p1.props.PaddingTop else UDim.new(0, ConstantsModule.SkinColorGridPadding),
		PaddingBottom = if p1.props.PaddingBottom then p1.props.PaddingBottom else UDim.new(0, ConstantsModule.SkinColorGridPadding),
		PaddingLeft = if p1.props.PaddingLeft then p1.props.PaddingLeft else UDim.new(0, ConstantsModule.SkinColorGridPadding),
		PaddingRight = if p1.props.PaddingRight then p1.props.PaddingRight else UDim.new(0, ConstantsModule.SkinColorGridPadding)
	})
end

function BodyColorsFrame.renderBodyPartsList(p1, p2)
	-- upvalues: ConstantsModule (copy), RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), RadioButtonList (copy)
	local RadioButtons = {}
	
	for i = 1, #ConstantsModule.BodyPartButtonData do
		table.insert(RadioButtons, { label = p2["bodyPart" .. i] })
	end
	return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromOffset(150, 0),
		BackgroundTransparency = 1,
		[RoactModule.Change.AbsoluteSize] = p1.onBodyPartsListAbsoluteSizeChanged
	}, {
		UIPadding = RoactModule.createElement("UIPadding", {
			PaddingTop = if p1.props.PaddingTop then p1.props.PaddingTop else UDim.new(0, ConstantsModule.SkinColorGridPadding),
			PaddingBottom = if p1.props.PaddingBottom then p1.props.PaddingBottom else UDim.new(0, ConstantsModule.SkinColorGridPadding)
		}),
		BodyPartRadioButtons = RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then RadioButtonList else Focusable[RadioButtonList], {
			radioButtons = RadioButtons,
			onActivated = function(p3)
				-- upvalues: p1 (copy)
				p1:setSelectedBodyPartIndex(p3)
			end,
			initialValue = p1.props.selectedBodyPartIndex,
			elementSize = UDim2.new(1, -10, 0, 25),
			automaticSize = true,
			padding = UDim.new(0, 10),
			NextSelectionRight = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.bodyColorButtonsRef,
			NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.NextSelectionUp,
			[RoactModule.Ref] = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.bodyPartButtonsRef
		})
	})
end

function BodyColorsFrame.renderStandardView(p3)
	-- upvalues: WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy), WithLocalizationFunction (copy), RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), FFlagAXAdaptiveScrollingFixForward (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), ConstantsModule (copy)
	local AdaptiveScrolling = p3.props.adaptiveScrolling or {}
	
	return WithStyleFunction(function(p4)
		-- upvalues: WithSelectionCursorProviderFunction (upval), WithLocalizationFunction (upval), p3 (copy), RoactModule (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), Focusable (upval), AdaptiveScrolling (copy), FFlagAXAdaptiveScrollingFixForward (upval), GetFFlagAXEnableSlotBasedEditorModule (upval), ConstantsModule (upval)
		return WithSelectionCursorProviderFunction(function(p5)
			-- upvalues: WithLocalizationFunction (upval), p3 (upval), RoactModule (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), Focusable (upval), AdaptiveScrolling (upval), FFlagAXAdaptiveScrollingFixForward (upval), GetFFlagAXEnableSlotBasedEditorModule (upval), p4 (copy), ConstantsModule (upval)
			return WithLocalizationFunction({
				buttonText = "Feature.Avatar.Label.BodyColorAdvancedView"
			})(function(p6)
				-- upvalues: p3 (upval), RoactModule (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), Focusable (upval), AdaptiveScrolling (upval), FFlagAXAdaptiveScrollingFixForward (upval), GetFFlagAXEnableSlotBasedEditorModule (upval), p4 (upval), p5 (copy), ConstantsModule (upval)
				local SetViewSettingFunction = p3.props.setViewSetting
				
				return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "ScrollingFrame" else Focusable.ScrollingFrame, {
					BackgroundTransparency = 1,
					CanvasSize = p3.canvasSizeBinding,
					ScrollBarThickness = 0,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					Size = p3:getGridAndSidebarFrameSize(),
					NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else p3.props.NextSelectionUp,
					defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else p3.bodyColorButtonsRef,
					ScrollingEnabled = if AdaptiveScrolling.scrollingEnabledBinding then AdaptiveScrolling.scrollingEnabledBinding:map(function(p7)
						return p7
					end) elseif FFlagAXAdaptiveScrollingFixForward then true else AdaptiveScrolling.scrollingEnabled,
					Selectable = not FFlagAXMigrateAXToGlobalAutofocus and nil,
					[RoactModule.Change.CanvasPosition] = if GetFFlagAXEnableSlotBasedEditorModule() then p3.onScroll else AdaptiveScrolling.onCanvasPositionChanged
				}, {
					UIListLayout = p3:renderUIListLayout(),
					UIPadding = p3:renderUIPadding(),
					BodyColorButtons = p3:renderBodyColorButtons((p3:getItems())),
					AdvancedViewButton = p3:renderToggleButton(p6.buttonText, p4, p5, function()
						-- upvalues: SetViewSettingFunction (copy), ConstantsModule (upval)
						SetViewSettingFunction(ConstantsModule.ColorPickerViewSettings.AdvancedView)
					end)
				})
			end)
		end)
	end)
end

function BodyColorsFrame.renderAdvancedView(p3)
	-- upvalues: WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy), ConstantsModule (copy), WithLocalizationFunction (copy), RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), FFlagAXAdaptiveScrollingFixForward (copy), GetFFlagAXEnableSlotBasedEditorModule (copy)
	local AdaptiveScrolling = p3.props.adaptiveScrolling or {}
	
	return WithStyleFunction(function(p4)
		-- upvalues: WithSelectionCursorProviderFunction (upval), ConstantsModule (upval), WithLocalizationFunction (upval), p3 (copy), RoactModule (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), Focusable (upval), AdaptiveScrolling (copy), FFlagAXAdaptiveScrollingFixForward (upval), GetFFlagAXEnableSlotBasedEditorModule (upval)
		return WithSelectionCursorProviderFunction(function(p5)
			-- upvalues: ConstantsModule (upval), WithLocalizationFunction (upval), p3 (upval), RoactModule (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), Focusable (upval), AdaptiveScrolling (upval), FFlagAXAdaptiveScrollingFixForward (upval), GetFFlagAXEnableSlotBasedEditorModule (upval), p4 (copy)
			local config = {
				standardButtonText = "Feature.Avatar.Label.BodyColorStandardView"
			}
			
			for i, _ in ConstantsModule.BodyPartButtonData do
				config["bodyPart" .. i] = ConstantsModule.BodyPartButtonData[i].textKey
			end
			return WithLocalizationFunction(config)(function(p6)
				-- upvalues: p3 (upval), RoactModule (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), Focusable (upval), AdaptiveScrolling (upval), FFlagAXAdaptiveScrollingFixForward (upval), GetFFlagAXEnableSlotBasedEditorModule (upval), p4 (upval), p5 (copy), ConstantsModule (upval)
				local SetViewSettingFunction = p3.props.setViewSetting
				
				return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "ScrollingFrame" else Focusable.ScrollingFrame, {
					BackgroundTransparency = 1,
					Size = p3:getGridAndSidebarFrameSize(),
					CanvasSize = p3.canvasSizeBinding,
					ScrollBarThickness = 0,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					Position = UDim2.fromScale(0, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else p3.bodyColorButtonsRef,
					Selectable = not FFlagAXMigrateAXToGlobalAutofocus and nil,
					ScrollingEnabled = if AdaptiveScrolling.scrollingEnabledBinding then AdaptiveScrolling.scrollingEnabledBinding:map(function(p7)
						return p7
					end) elseif FFlagAXAdaptiveScrollingFixForward then true else AdaptiveScrolling.scrollingEnabled,
					[RoactModule.Change.CanvasPosition] = if GetFFlagAXEnableSlotBasedEditorModule() then p3.onScroll else AdaptiveScrolling.onCanvasPositionChanged
				}, {
					BodyPartsList = p3:renderBodyPartsList(p6),
					BodyColorsGrid = RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 150, 0, 0),
						Size = UDim2.new(1, -150, 1, 0),
						defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else p3.bodyColorButtonsRef
					}, {
						UIPadding = p3:renderUIPadding(),
						UIListLayout = p3:renderUIListLayout(),
						BodyColorButtons = p3:renderBodyColorButtons(p3:getItems(), if FFlagAXMigrateAXToGlobalAutofocus then nil else p3.bodyPartButtonsRef),
						StandardViewButton = p3:renderToggleButton(p6.standardButtonText, p4, p5, function()
							-- upvalues: p3 (upval), SetViewSettingFunction (copy), ConstantsModule (upval)
							p3:setSelectedBodyPartIndex(1)
							SetViewSettingFunction(ConstantsModule.ColorPickerViewSettings.StandardView)
						end)
					})
				})
			end)
		end)
	end)
end

function BodyColorsFrame.shouldRenderSliderBar(p4): boolean
	return if p4.props.rangeIdForSelectedBodyParts then true else false
end

function BodyColorsFrame.render(p4)
	-- upvalues: ConstantsModule (copy), RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), FFlagAXFixColorAdjustmentGamepadSupportModule (copy), BodyColorsSliderFrameModule (copy)
	return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		[RoactModule.Ref] = if FFlagAXFixColorAdjustmentGamepadSupportModule then p4.props.ref else nil,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = p4.props.Size,
		Position = UDim2.fromOffset(0, 0),
		defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else p4.bodyColorButtonsRef,
		Selectable = not FFlagAXMigrateAXToGlobalAutofocus and nil,
		[RoactModule.Change.AbsoluteSize] = p4.onBodyColorsFrameAbsoluteSizeChanged,
		LayoutOrder = p4.props.LayoutOrder
	}, {
		BodyColorsView = if p4.props.viewSetting == ConstantsModule.ColorPickerViewSettings.AdvancedView then p4:renderAdvancedView() else p4:renderStandardView(),
		BodyColorsSliderFrame = if p4:shouldRenderSliderBar() then RoactModule.createElement(BodyColorsSliderFrameModule, {
			sliderRef = if FFlagAXMigrateAXToGlobalAutofocus then nil else p4.sliderRef,
			NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else p4.toggleViewButtonRef,
			gridAndSidebarFrameSizeBinding = p4:getGridAndSidebarFrameSize(),
			rangeIdForSelectedBodyParts = p4.props.rangeIdForSelectedBodyParts,
			defaultBodyColorRanges = p4.props.defaultBodyColorRanges
		}) else nil
	})
end

function BodyColorsFrame.didMount(p4)
	-- upvalues: UtilsModule1 (copy)
	local BodyPartRangeIds = p4.props.bodyPartRangeIds
	local t = {}
	local Flag = false
	
	for i, bodyColor3 in p4.props.bodyColor3s do
		if BodyPartRangeIds[i] == nil then
			Flag = true
			local _
			t[i], _ = UtilsModule1.findRangeAndSliderValueForColor3(bodyColor3, p4.props.defaultBodyColorRanges)
		else
			t[i] = BodyPartRangeIds[i]
		end
	end
	if Flag then
		p4.props.setBodyPartRangeIds(t)
	end
end

return (WithAdaptiveScrollingFunction((RoactRoduxModule.connect(function(p5, _)
	-- upvalues: SelectRangeIdForSelectedBodyPartsModule (copy), SelectAvatarPreviewColors (copy)
	return {
		viewSetting = p5.AvatarExperience.AvatarEditor.BodyColorPickerSettings.viewSetting,
		rangeIdForSelectedBodyParts = SelectRangeIdForSelectedBodyPartsModule(p5),
		defaultBodyColorRanges = p5.AvatarExperience.AvatarEditor.DefaultBodyColorRanges,
		bodyColor3s = SelectAvatarPreviewColors(p5),
		bodyPartRangeIds = p5.AvatarExperience.AvatarEditor.Character.BodyPartRangeIds,
		selectedBodyPartIndex = p5.AvatarExperience.AvatarEditor.BodyColorPickerSettings.selectedBodyPartIndex
	}
end, function(Callback)
	-- upvalues: SetBodyColorViewSettingModule (copy), SetBodyPartRangeIdsModule (copy), SetSelectedBodyPartIndexModule (copy)
	return {
		setViewSetting = function(p5)
			-- upvalues: Callback (copy), SetBodyColorViewSettingModule (upval)
			Callback(SetBodyColorViewSettingModule(p5))
		end,
		setBodyPartRangeIds = function(p5)
			-- upvalues: Callback (copy), SetBodyPartRangeIdsModule (upval)
			Callback(SetBodyPartRangeIdsModule(p5))
		end,
		setSelectedBodyPartIndex = function(p5)
			-- upvalues: Callback (copy), SetSelectedBodyPartIndexModule (upval)
			Callback(SetSelectedBodyPartIndexModule(p5))
		end
	}
end)(BodyColorsFrame))))