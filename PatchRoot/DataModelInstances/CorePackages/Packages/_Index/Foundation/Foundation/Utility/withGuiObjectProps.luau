-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:30 2026 Pacific Standard Time.

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

return function(p0, p1) --[[ line: 52 | named "withGuiObjectProps" ]]
	-- upvalues: indexBindableModule (ref), getEngineFeature (ref), reactIsModule (ref), withCommonPropsModule (ref), reactModule (ref), getTestIdTagModule (ref)
	if type(p1) == "table" then
		p1.AutoLocalize = p0.AutoLocalize
		p1.AutomaticSize = p0.AutomaticSize
		p1.BackgroundColor3 = if p0.backgroundStyle then indexBindableModule(p0.backgroundStyle, "Color3") else nil
		p1.BackgroundTransparency = if p0.backgroundStyle then indexBindableModule(p0.backgroundStyle, "Transparency") else nil
		p1.BorderSizePixel = p0.BorderSizePixel
		p1.BorderColor3 = p0.BorderColor3
		p1.BorderMode = p0.BorderMode
		p1.ClipsDescendants = p0.ClipsDescendants
		
		if getEngineFeature then
			p1.InputSink = p0.InputSink
		end
		p1.Rotation = p0.Rotation
		p1.SizeConstraint = p0.SizeConstraint
		
		if p0.selection then
			p1.Selectable = p0.selection.Selectable
			p1.SelectionImageObject = p0.selection.SelectionImageObject
			p1.SelectionOrder = p0.selection.SelectionOrder
			p1.NextSelectionDown = p0.selection.NextSelectionDown
			p1.NextSelectionLeft = p0.selection.NextSelectionLeft
			p1.NextSelectionRight = p0.selection.NextSelectionRight
			p1.NextSelectionUp = p0.selection.NextSelectionUp
		end
		if p0.selectionGroup ~= nil then
			if type(p0.selectionGroup) == "boolean" or reactIsModule.isBinding(p0.selectionGroup) then
				p1.SelectionGroup = p0.selectionGroup
			else
				local selectionGroup = p0.selectionGroup
				p1.SelectionGroup = true
				p1.SelectionBehaviorUp = selectionGroup.SelectionBehaviorUp
				p1.SelectionBehaviorDown = selectionGroup.SelectionBehaviorDown
				p1.SelectionBehaviorLeft = selectionGroup.SelectionBehaviorLeft
				p1.SelectionBehaviorRight = selectionGroup.SelectionBehaviorRight
			end
		end
		p1.Size = p0.Size
	end
	local var8 = withCommonPropsModule(p0, p1)
	var8[reactModule.Change.AbsoluteSize] = p0.onAbsoluteSizeChanged
	var8.onAbsoluteSizeChanged = nil
	var8[reactModule.Change.AbsolutePosition] = p0.onAbsolutePositionChanged
	var8.onAbsolutePositionChanged = nil
	local var9 = getTestIdTagModule(var8.testId)
	
	if var8[reactModule.Tag] and var9 then
		var8[reactModule.Tag] ..= " " .. var9
	else
		var8[reactModule.Tag] = var8[reactModule.Tag] or var9
	end
	var8.testId = nil
	
	return var8
end