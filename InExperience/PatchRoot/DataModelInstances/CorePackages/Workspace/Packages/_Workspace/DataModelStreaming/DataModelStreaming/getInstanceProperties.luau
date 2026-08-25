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

local function getProperty(p0, p1)
	local ok, status = pcall(function()
		-- upvalues: p0 (ref), p1 (ref)
		return p0[p1]
	end)
	
	if not ok or status == nil then
		return nil
	end
	local function _(p2)
		return if p2 == 1e999 then "inf" elseif p2 == -1e999 then "-inf" else p2
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
		local var4 = if x == 1e999 then "inf" elseif x == -1e999 then "-inf" else x
		local y = status.Y
		local z = status.Z
		-- Unknown statement at pc 5: <SetList>
		
		return t
	elseif typeof(status) == "Color3" then
		return { status.R, status.G, status.B }
	elseif typeof(status) == "UDim2" then
		local t = {}
		local scale = status.X.Scale
		local var6 = if scale == 1e999 then "inf" elseif scale == -1e999 then "-inf" else scale
		local offset = status.X.Offset
		local var7 = if offset == 1e999 then "inf" elseif offset == -1e999 then "-inf" else offset
		local scale_1 = status.Y.Scale
		local offset_1 = status.Y.Offset
		-- Unknown statement at pc 7: <SetList>
		
		return t
	elseif typeof(status) == "Rect" then
		local t = {}
		local x = status.Min.X
		local var9 = if x == 1e999 then "inf" elseif x == -1e999 then "-inf" else x
		local y = status.Min.Y
		local var10 = if y == 1e999 then "inf" elseif y == -1e999 then "-inf" else y
		local x_1 = status.Max.X
		local y_1 = status.Max.Y
		-- Unknown statement at pc 7: <SetList>
		
		return t
	end
	return if typeof(status) == "number" or typeof(status) == "boolean" then status else tostring(status)
end

return function(p3, p4)
	-- upvalues: t (ref), getProperty (ref)
	if not p3 then
		return {}
	end
	local t_1 = { ClassName = p3.ClassName, Name = p3.Name }
	
	for i, v in t do
		if p3:IsA(i) then
			for i_1, v_1 in v do
				if p4 == nil or table.find(p4, v_1) then
					local var12 = getProperty(p3, v_1)
					
					if var12 ~= nil then
						t_1[v_1] = var12
					end
				end
			end
		end
	end
	for i_1, v_1 in p3:GetTags() do
		if string.sub(v_1, 1, 12) == "data-testid=" then
			t_1.TestId = string.sub(v_1, 13)
		end
	end
	return t_1
end