local config = {
	GuiBase2d = {
		"AbsolutePosition", "AbsoluteRotation", "AbsoluteSize", "AutoLocalize",
		"ClippedRect", "IsNotOccluded", "RawRect2D", "ReplicatedInsertionOrder",
		"RootLocalizationTable", "SelectionBehaviorDown", "SelectionBehaviorLeft",
		"SelectionBehaviorRight", "SelectionBehaviorUp", "SelectionGroup",
		"TotalGroupScale"
	},
	GuiObject = {
		"Active", "AnchorPoint", "AutomaticSize", "BackgroundColor",
		"BackgroundColor3", "BackgroundTransparency", "BorderColor", "BorderColor3",
		"BorderMode", "BorderSizePixel", "ClipsDescendants", "Draggable", "GuiState",
		"Interactable", "LayoutOrder", "NextSelectionDown", "NextSelectionLeft",
		"NextSelectionRight", "NextSelectionUp", "Position", "Rotation", "Selectable",
		"SelectionImageObject", "SelectionOrder", "SelectionRect2D", "Size",
		"SizeConstraint", "Transparency", "Visible", "ZIndex"
	},
	TextLabel = {
		"Confidential", "ContentText", "Font", "FontFace", "LineHeight",
		"LocalizationMatchIdentifier", "LocalizationMatchedSourceText",
		"LocalizedText", "MaxVisibleGraphemes", "OpenTypeFeatures",
		"OpenTypeFeaturesError", "RichText", "Text", "TextBounds", "TextColor3",
		"TextDirection", "TextFits", "TextScaled", "TextSize", "TextStrokeColor3",
		"TextStrokeTransparency", "TextTransparency", "TextTruncate", "TextWrapped",
		"TextXAlignment", "TextYAlignment"
	},
	TextButton = {
		"Confidential", "ContentText", "Font", "FontFace", "LineHeight",
		"LocalizationMatchIdentifier", "LocalizationMatchedSourceText",
		"LocalizedText", "MaxVisibleGraphemes", "OpenTypeFeatures",
		"OpenTypeFeaturesError", "RichText", "Text", "TextBounds", "TextColor3",
		"TextDirection", "TextFits", "TextScaled", "TextSize", "TextStrokeColor3",
		"TextStrokeTransparency", "TextTransparency", "TextTruncate", "TextWrapped",
		"TextXAlignment", "TextYAlignment"
	},
	TextBox = {
		"ClearTextOnFocus", "Confidential", "ContentText", "CursorPosition", "Font",
		"FontFace", "LineHeight", "LocalizationMatchIdentifier",
		"LocalizationMatchedSourceText", "LocalizedText", "ManualFocusRelease",
		"MaxVisibleGraphemes", "MultiLine", "OpenTypeFeatures",
		"OpenTypeFeaturesError", "OverlayNativeInput", "PlaceholderColor3",
		"PlaceholderText", "ReturnKeyType", "RichText", "SelectionStart",
		"ShouldEmitReturnEvents", "ShouldEmitUpAndDownArrowEvents", "ShowNativeInput",
		"Text", "TextBounds", "TextColor3", "TextDirection", "TextEditable",
		"TextFits", "TextInputType", "TextScaled", "TextSize", "TextStrokeColor3",
		"TextStrokeTransparency", "TextTransparency", "TextTruncate", "TextWrapped",
		"TextXAlignment", "TextYAlignment"
	},
	ImageLabel = {
		"BackgroundTransparency", "ContentImageSize", "Image", "ImageColor3",
		"ImageRectOffset", "ImageRectSize", "ImageTransparency", "IsLoaded",
		"ResampleMode", "ScaleType", "SliceCenter", "SliceScale", "TileSize"
	},
	ImageButton = {
		"BackgroundTransparency", "ContentImageSize", "HoverImage", "Image",
		"ImageColor3", "ImageRectOffset", "ImageRectSize", "ImageTransparency",
		"IsLoaded", "PressedImage", "ResampleMode", "ScaleType", "SliceCenter",
		"SliceScale", "TileSize"
	},
	Frame = { "BackgroundTransparency", "Style" },
	ScrollingFrame = {
		"AbsoluteCanvasSize", "AbsoluteWindowSize", "AutomaticCanvasSize",
		"BottomImage", "CanvasPosition", "CanvasSize", "DraggingScrollBar",
		"ElasticBehavior", "HorizontalScrollBarInset", "HorizontalScrollBarPosition",
		"MidImage", "ScrollBarImageColor3", "ScrollBarImageTransparency",
		"ScrollBarThickness", "ScrollRate", "ScrollVelocity", "ScrollingDirection",
		"ScrollingEnabled", "SmoothScroll", "TopImage", "VerticalScrollBarInset",
		"VerticalScrollBarPosition"
	},
	LayerCollector = { "Enabled", "ResetOnSpawn", "ZIndexBehavior" }
}

local function getProperty(p1, p2)
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy), p2 (copy)
		return p1[p2]
	end)
	
	if not Success or Result == nil then
		return nil
	end
	local function _(p3)
		return if p3 == 1e999 then "inf" elseif p3 == -1e999 then "-inf" else p3
	end
	
	if typeof(Result) == "Vector2" then
		local X = Result.X
		local Y = Result.Y
		
		return {
			if X == 1e999 then "inf" elseif X == -1e999 then "-inf" else X,
			if Y == 1e999 then "inf" elseif Y == -1e999 then "-inf" else Y
		}
	elseif typeof(Result) == "Vector3" then
		local X = Result.X
		local Y = Result.Y
		local Z = Result.Z
		
		return {
			if X == 1e999 then "inf" elseif X == -1e999 then "-inf" else X,
			if Y == 1e999 then "inf" elseif Y == -1e999 then "-inf" else Y,
			if Z == 1e999 then "inf" elseif Z == -1e999 then "-inf" else Z
		}
	elseif typeof(Result) == "Color3" then
		return { Result.R, Result.G, Result.B }
	elseif typeof(Result) == "UDim2" then
		local Scale = Result.X.Scale
		local Offset = Result.X.Offset
		local Scale1 = Result.Y.Scale
		local Offset1 = Result.Y.Offset
		
		return {
			if Scale == 1e999 then "inf" elseif Scale == -1e999 then "-inf" else Scale,
			if Offset == 1e999 then "inf" elseif Offset == -1e999 then "-inf" else Offset,
			if Scale1 == 1e999 then "inf" elseif Scale1 == -1e999 then "-inf" else Scale1,
			if Offset1 == 1e999 then "inf" elseif Offset1 == -1e999 then "-inf" else Offset1
		}
	elseif typeof(Result) == "Rect" then
		local X = Result.Min.X
		local Y = Result.Min.Y
		local X1 = Result.Max.X
		local Y1 = Result.Max.Y
		
		return {
			if X == 1e999 then "inf" elseif X == -1e999 then "-inf" else X,
			if Y == 1e999 then "inf" elseif Y == -1e999 then "-inf" else Y,
			if X1 == 1e999 then "inf" elseif X1 == -1e999 then "-inf" else X1,
			if Y1 == 1e999 then "inf" elseif Y1 == -1e999 then "-inf" else Y1
		}
	else
		return if typeof(Result) == "number" or typeof(Result) == "boolean" then Result else tostring(Result)
	end
end

return function(Object, List)
	-- upvalues: config (copy), getProperty (copy)
	if not Object then
		return {}
	end
	local config1 = { ClassName = Object.ClassName, Name = Object.Name }
	
	for ClassName, value in config do
		if Object:IsA(ClassName) then
			for _, value1 in value do
				if List == nil or table.find(List, value1) then
					local Property = getProperty(Object, value1)
					
					if Property ~= nil then
						config1[value1] = Property
					end
				end
			end
		end
	end
	for _, tag in Object:GetTags() do
		if string.sub(tag, 1, 12) == "data-testid=" then
			config1.TestId = string.sub(tag, 13)
		end
	end
	return config1
end