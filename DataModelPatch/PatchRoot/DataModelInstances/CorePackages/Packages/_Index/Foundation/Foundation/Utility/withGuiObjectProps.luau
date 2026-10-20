local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local _ = require(Foundation.Components.Types)
local GetTestIdTagModule = require(Foundation.Utility.getTestIdTag)
local IndexBindableModule = require(Foundation.Utility.indexBindable)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local Success = require(Foundation.Utility.Flags).FoundationGuiObjectInputSinkProperty and pcall(game.GetEngineFeature, game, "GuiObjectInputSink")

return function(Frame: Frame, p1)
	-- upvalues: IndexBindableModule (copy), Success (copy), ReactIsModule (copy), WithCommonPropsModule (copy), ReactModule (copy), GetTestIdTagModule (copy)
	if type(p1) == "table" then
		p1.AutoLocalize = Frame.AutoLocalize
		p1.AutomaticSize = Frame.AutomaticSize
		p1.BackgroundColor3 = if Frame.backgroundStyle then IndexBindableModule(Frame.backgroundStyle, "Color3") else nil
		p1.BackgroundTransparency = if Frame.backgroundStyle then IndexBindableModule(Frame.backgroundStyle, "Transparency") else nil
		p1.BorderSizePixel = Frame.BorderSizePixel
		p1.BorderColor3 = Frame.BorderColor3
		p1.BorderMode = Frame.BorderMode
		p1.ClipsDescendants = Frame.ClipsDescendants
		
		if Success then
			p1.InputSink = Frame.InputSink
		end
		p1.Rotation = Frame.Rotation
		p1.SizeConstraint = Frame.SizeConstraint
		
		if Frame.selection then
			p1.Selectable = Frame.selection.Selectable
			p1.SelectionImageObject = Frame.selection.SelectionImageObject
			p1.SelectionOrder = Frame.selection.SelectionOrder
			p1.NextSelectionDown = Frame.selection.NextSelectionDown
			p1.NextSelectionLeft = Frame.selection.NextSelectionLeft
			p1.NextSelectionRight = Frame.selection.NextSelectionRight
			p1.NextSelectionUp = Frame.selection.NextSelectionUp
		end
		if Frame.selectionGroup ~= nil then
			if type(Frame.selectionGroup) == "boolean" or ReactIsModule.isBinding(Frame.selectionGroup) then
				p1.SelectionGroup = Frame.selectionGroup
			else
				local SelectionGroup = Frame.selectionGroup
				p1.SelectionGroup = true
				p1.SelectionBehaviorUp = SelectionGroup.SelectionBehaviorUp
				p1.SelectionBehaviorDown = SelectionGroup.SelectionBehaviorDown
				p1.SelectionBehaviorLeft = SelectionGroup.SelectionBehaviorLeft
				p1.SelectionBehaviorRight = SelectionGroup.SelectionBehaviorRight
			end
		end
		p1.Size = Frame.Size
	end
	local WithCommonPropsModuleResult = WithCommonPropsModule(Frame, p1)
	WithCommonPropsModuleResult[ReactModule.Change.AbsoluteSize] = Frame.onAbsoluteSizeChanged
	WithCommonPropsModuleResult.onAbsoluteSizeChanged = nil
	WithCommonPropsModuleResult[ReactModule.Change.AbsolutePosition] = Frame.onAbsolutePositionChanged
	WithCommonPropsModuleResult.onAbsolutePositionChanged = nil
	local TestIdTagModule = GetTestIdTagModule(WithCommonPropsModuleResult.testId)
	
	if WithCommonPropsModuleResult[ReactModule.Tag] and TestIdTagModule then
		local Tag = ReactModule.Tag
		WithCommonPropsModuleResult[Tag] ..= " " .. TestIdTagModule
	else
		WithCommonPropsModuleResult[ReactModule.Tag] = WithCommonPropsModuleResult[ReactModule.Tag] or TestIdTagModule
	end
	WithCommonPropsModuleResult.testId = nil
	
	return WithCommonPropsModuleResult
end