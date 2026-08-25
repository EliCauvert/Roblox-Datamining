local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local withLocalization = require(parent.Localization).withLocalization
local withStyle = require(parent.UIBlox).Style.withStyle
local argCheckModule = require(parent.ArgCheck)
local fitChildrenModule = require(authCommon.Components.FitChildren)
local fitTextLabelModule = require(authCommon.Components.FitTextLabel)
local formFactor = require(parent.FormFactor).Enums.FormFactor
local titleAndParagraph = roactModule.PureComponent:extend("TitleAndParagraph")
local registerAuditContentModule = require(authCommon.Components.RegisterAuditContent)
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagEnableAuditForSinglePageSignUp = sharedFlagsModule.GetFFlagEnableAuditForSinglePageSignUp
local getFFlagEnableAuditForSso = sharedFlagsModule.GetFFlagEnableAuditForSso
titleAndParagraph.defaultProps = {
	layoutOrder = 0,
	textXAlignment = Enum.TextXAlignment.Left,
	paragraphTextKeys = {},
	paragraphTextArgs = {}
}

function titleAndParagraph.init(p0)
	p0.parametersCache = {}
end

function titleAndParagraph.getCachedParameters(p1, p2, p3)
	if type(p3) ~= "table" then
		return nil
	end
	local var9 = p1.parametersCache[p2]
	
	if var9 then
		return var9
	end
	local t = {}
	
	for i, v in pairs(p3) do
		if type(i) == "string" then
			t[i] = tostring(v)
		end
	end
	p1.parametersCache[p2] = t
	
	return t
end

local _ = function(p4)
	return "paragraphText" .. tostring(p4)
end

local _ = function(p5)
	return "paragraphTextTemplate" .. tostring(p5)
end

function titleAndParagraph.render(p6)
	-- upvalues: argCheckModule (ref), getFFlagEnableAuditForSso (ref), getFFlagEnableAuditForSinglePageSignUp (ref), withLocalization (ref), withStyle (ref), formFactor (ref), roactModule (ref), fitTextLabelModule (ref), fitChildrenModule (ref), registerAuditContentModule (ref)
	local formFactor_1 = p6.props.formFactor
	local layoutOrder = p6.props.layoutOrder
	local titleTextKey = p6.props.titleTextKey
	local paragraphTextKeys = p6.props.paragraphTextKeys
	local width = p6.props.width
	local textXAlignment = p6.props.textXAlignment
	argCheckModule.isType(paragraphTextKeys, "table", "TitleAndParagraph expects paragraphTextKeys to be a table.")
	local var11 = if width then UDim2.new(0, width, 0, 0) else UDim2.new(1, 0, 0, 0)
	local t = { titleText = titleTextKey }
	
	for i, v in ipairs(paragraphTextKeys) do
		t["paragraphText" .. tostring(i)] = v
		
		if getFFlagEnableAuditForSso() and getFFlagEnableAuditForSinglePageSignUp() and (p6.props.enableAuditContentCapture and type(v) == "table") then
			t["paragraphTextTemplate" .. tostring(i)] = v[1]
		end
	end
	if not getFFlagEnableAuditForSso() and getFFlagEnableAuditForSinglePageSignUp() and p6.props.enableAuditContentCapture then
		t.verificationLinkingTextTemplate = "Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName"
	end
	return withLocalization(t)(function(p7)
		-- upvalues: withStyle (copy), formFactor_1 (ref), formFactor (copy), roactModule (copy), fitTextLabelModule (copy), textXAlignment (ref), fitChildrenModule (copy), paragraphTextKeys (ref), getFFlagEnableAuditForSinglePageSignUp (copy), p6 (ref), registerAuditContentModule (copy), getFFlagEnableAuditForSso (copy), layoutOrder (ref), var11 (write)
		return withStyle(function(p8)
			-- upvalues: formFactor_1 (copy), formFactor (copy), roactModule (copy), p7 (ref), fitTextLabelModule (copy), textXAlignment (copy), fitChildrenModule (copy), paragraphTextKeys (copy), getFFlagEnableAuditForSinglePageSignUp (copy), p6 (copy), registerAuditContentModule (copy), getFFlagEnableAuditForSso (copy), layoutOrder (copy), var11 (copy)
			local var13 = p8.Font.BaseSize * p8.Font.Title.RelativeSize
			local font = p8.Font.Title.Font
			local var14 = 12
			local var15 = p8.Font.BaseSize * p8.Font.Body.RelativeSize
			local font_1 = p8.Font.Body.Font
			
			if formFactor_1 == formFactor.COMPACT then
				var13 = p8.Font.BaseSize * p8.Font.Title.RelativeMinSize
				var14 = 5
				var15 = p8.Font.BaseSize * p8.Font.Body.RelativeMinSize
			end
			local var16 = 0
			local t = {
				Layout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, var14)
				}),
				Title = p7.titleText and roactModule.createElement(fitTextLabelModule, {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					TextWrapped = true,
					LayoutOrder = var16,
					TextXAlignment = textXAlignment,
					TextYAlignment = Enum.TextYAlignment.Top,
					Text = p7.titleText,
					TextSize = var13,
					Font = font,
					TextColor3 = p8.Theme.SystemPrimaryDefault.Color,
					TextTransparency = p8.Theme.SystemPrimaryDefault.Transparency,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = fitChildrenModule.FitAxis.Height
				})
			}
			
			for i, v in ipairs(paragraphTextKeys) do
				var16 += 1
				local text = "paragraphText" .. tostring(i)
				local var19 = p7[text]
				t[text] = roactModule.createElement(fitTextLabelModule, {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					TextWrapped = true,
					LayoutOrder = var16,
					TextXAlignment = textXAlignment,
					TextYAlignment = Enum.TextYAlignment.Top,
					Text = var19,
					TextSize = var15,
					Font = font_1,
					TextColor3 = p8.Theme.TextDefault.Color,
					TextTransparency = p8.Theme.TextDefault.Transparency,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = fitChildrenModule.FitAxis.Height
				})
				
				if getFFlagEnableAuditForSinglePageSignUp() and p6.props.enableAuditContentCapture and (registerAuditContentModule and var19) then
					local text_1 = "AuditContent_" .. text
					t[text_1] = roactModule.createElement(registerAuditContentModule, {
						translationKey = if type(v) == "table" then v[1] else v,
						translatedSourceString = if type(v) == "table" then if getFFlagEnableAuditForSso() then p7["paragraphTextTemplate" .. tostring(i)] else p7.verificationLinkingTextTemplate else var19,
						parameters = p6:getCachedParameters(text_1, v)
					})
				end
			end
			return roactModule.createElement(fitChildrenModule.FitFrame, {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = layoutOrder,
				Size = var11,
				fitAxis = fitChildrenModule.FitAxis.Height
			}, t)
		end)
	end)
end

return roactRoduxModule.connect(function(p9, _)
	return { formFactor = p9.FormFactor }
end)(titleAndParagraph)