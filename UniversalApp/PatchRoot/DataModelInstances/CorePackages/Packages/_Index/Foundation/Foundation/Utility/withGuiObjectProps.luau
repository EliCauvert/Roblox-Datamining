local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local _ = require(foundation.Components.Types)
local flagsModule = require(foundation.Utility.Flags)
local getTestIdTagModule = require(foundation.Utility.getTestIdTag)
local indexBindableModule = require(foundation.Utility.indexBindable)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local getEngineFeature = flagsModule.FoundationGuiObjectInputSinkProperty and pcall(game.GetEngineFeature, game, "GuiObjectInputSink")

return function(p1, p2)
	-- upvalues: indexBindableModule (ref), getEngineFeature (ref), reactIsModule (ref), withCommonPropsModule (ref), reactModule (ref), getTestIdTagModule (ref)
	if type(p2) == "table" then
		p2.AutoLocalize = p1.AutoLocalize
		p2.AutomaticSize = p1.AutomaticSize
		p2.BackgroundColor3 = if p1.backgroundStyle then indexBindableModule(p1.backgroundStyle, "Color3") else nil
		p2.BackgroundTransparency = if p1.backgroundStyle then indexBindableModule(p1.backgroundStyle, "Transparency") else nil
		p2.BorderSizePixel = p1.BorderSizePixel
		p2.BorderColor3 = p1.BorderColor3
		p2.BorderMode = p1.BorderMode
		p2.ClipsDescendants = p1.ClipsDescendants
		
		if getEngineFeature then
			p2.InputSink = p1.InputSink
		end
		p2.Rotation = p1.Rotation
		p2.SizeConstraint = p1.SizeConstraint
		
		if p1.selection then
			p2.Selectable = p1.selection.Selectable
			p2.SelectionImageObject = p1.selection.SelectionImageObject
			p2.SelectionOrder = p1.selection.SelectionOrder
			p2.NextSelectionDown = p1.selection.NextSelectionDown
			p2.NextSelectionLeft = p1.selection.NextSelectionLeft
			p2.NextSelectionRight = p1.selection.NextSelectionRight
			p2.NextSelectionUp = p1.selection.NextSelectionUp
		end
		if p1.selectionGroup ~= nil then
			if type(p1.selectionGroup) == "boolean" or reactIsModule.isBinding(p1.selectionGroup) then
				p2.SelectionGroup = p1.selectionGroup
			else
				local selectionGroup = p1.selectionGroup
				p2.SelectionGroup = true
				p2.SelectionBehaviorUp = selectionGroup.SelectionBehaviorUp
				p2.SelectionBehaviorDown = selectionGroup.SelectionBehaviorDown
				p2.SelectionBehaviorLeft = selectionGroup.SelectionBehaviorLeft
				p2.SelectionBehaviorRight = selectionGroup.SelectionBehaviorRight
			end
		end
		p2.Size = p1.Size
	end
	local var1 = withCommonPropsModule(p1, p2)
	var1[reactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged
	var1.onAbsoluteSizeChanged = nil
	var1[reactModule.Change.AbsolutePosition] = p1.onAbsolutePositionChanged
	var1.onAbsolutePositionChanged = nil
	local var2 = getTestIdTagModule(var1.testId)
	
	if var1[reactModule.Tag] and var2 then
		var1[reactModule.Tag] ..= " " .. var9
	else
		var1[reactModule.Tag] = var1[reactModule.Tag] or var2
	end
	var1.testId = nil
	
	return var1
end