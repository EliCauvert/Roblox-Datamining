local t = {
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
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), p2 (ref)
		return p1[p2]
	end)
	
	if not ok or status == nil then
		return nil
	end
	local function _(p3)
		return if p3 == 1e999 then "inf" elseif p3 == -1e999 then "-inf" else p3
	end
	
	if typeof(status) == "Vector2" then
		local t = {}
		local x = status.X
		local y = status.Y
		-- Unknown statement at pc 3: <SetList>
		
		return t
	elseif typeof(status) == "Vector3" then
		local t = {}
		local x = status.X
		local var1 = if x == 1e999 then "inf" elseif x == -1e999 then "-inf" else x
		local y = status.Y
		local z = status.Z
		-- Unknown statement at pc 5: <SetList>
		
		return t
	elseif typeof(status) == "Color3" then
		return { status.R, status.G, status.B }
	elseif typeof(status) == "UDim2" then
		local t = {}
		local scale = status.X.Scale
		local var2 = if scale == 1e999 then "inf" elseif scale == -1e999 then "-inf" else scale
		local offset = status.X.Offset
		local var3 = if offset == 1e999 then "inf" elseif offset == -1e999 then "-inf" else offset
		local scale_1 = status.Y.Scale
		local offset_1 = status.Y.Offset
		-- Unknown statement at pc 7: <SetList>
		
		return t
	elseif typeof(status) == "Rect" then
		local t = {}
		local x = status.Min.X
		local var4 = if x == 1e999 then "inf" elseif x == -1e999 then "-inf" else x
		local y = status.Min.Y
		local var5 = if y == 1e999 then "inf" elseif y == -1e999 then "-inf" else y
		local x_1 = status.Max.X
		local y_1 = status.Max.Y
		-- Unknown statement at pc 7: <SetList>
		
		return t
	end
	return if typeof(status) == "number" or typeof(status) == "boolean" then status else tostring(status)
end

return function(p1, p2)
	-- upvalues: t (ref), getProperty (ref)
	if not p1 then
		return {}
	end
	local t_1 = { ClassName = p1.ClassName, Name = p1.Name }
	
	for i, v in t do
		if p1:IsA(i) then
			for i_1, v_1 in v do
				if p2 == nil or table.find(p2, v_1) then
					local var1 = getProperty(p1, v_1)
					
					if var1 ~= nil then
						t_1[v_1] = var1
					end
				end
			end
		end
	end
	for i_1, v_1 in p1:GetTags() do
		if string.sub(v_1, 1, 12) == "data-testid=" then
			t_1.TestId = string.sub(v_1, 13)
		end
	end
	return t_1
end