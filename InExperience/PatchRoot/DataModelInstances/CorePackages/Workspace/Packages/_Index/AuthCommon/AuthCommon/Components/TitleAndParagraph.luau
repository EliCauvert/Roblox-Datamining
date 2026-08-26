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

function titleAndParagraph.init(p1)
	p1.parametersCache = {}
end

function titleAndParagraph.getCachedParameters(p1, p2, p3)
	if type(p3) ~= "table" then
		return nil
	end
	local var1 = p1.parametersCache[p2]
	
	if var1 then
		return var1
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

local _ = function(p4)
	return "paragraphTextTemplate" .. tostring(p4)
end

function titleAndParagraph.render(p4)
	-- upvalues: argCheckModule (ref), getFFlagEnableAuditForSso (ref), getFFlagEnableAuditForSinglePageSignUp (ref), withLocalization (ref), withStyle (ref), formFactor (ref), roactModule (ref), fitTextLabelModule (ref), fitChildrenModule (ref), registerAuditContentModule (ref)
	local formFactor_1 = p4.props.formFactor
	local layoutOrder = p4.props.layoutOrder
	local titleTextKey = p4.props.titleTextKey
	local paragraphTextKeys = p4.props.paragraphTextKeys
	local width = p4.props.width
	local textXAlignment = p4.props.textXAlignment
	argCheckModule.isType(paragraphTextKeys, "table", "TitleAndParagraph expects paragraphTextKeys to be a table.")
	local var2 = if width then UDim2.new(0, width, 0, 0) else UDim2.new(1, 0, 0, 0)
	local t = { titleText = titleTextKey }
	
	for i, v in ipairs(paragraphTextKeys) do
		t["paragraphText" .. tostring(i)] = v
		
		if getFFlagEnableAuditForSso() and getFFlagEnableAuditForSinglePageSignUp() and (p4.props.enableAuditContentCapture and type(v) == "table") then
			t["paragraphTextTemplate" .. tostring(i)] = v[1]
		end
	end
	if not getFFlagEnableAuditForSso() and getFFlagEnableAuditForSinglePageSignUp() and p4.props.enableAuditContentCapture then
		t.verificationLinkingTextTemplate = "Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName"
	end
	return withLocalization(t)(function(p5)
		-- upvalues: withStyle (copy), formFactor_1 (ref), formFactor (copy), roactModule (copy), fitTextLabelModule (copy), textXAlignment (ref), fitChildrenModule (copy), paragraphTextKeys (ref), getFFlagEnableAuditForSinglePageSignUp (copy), p4 (ref), registerAuditContentModule (copy), getFFlagEnableAuditForSso (copy), layoutOrder (ref), var2 (write)
		return withStyle(function(p6)
			-- upvalues: formFactor_1 (copy), formFactor (copy), roactModule (copy), p5 (ref), fitTextLabelModule (copy), textXAlignment (copy), fitChildrenModule (copy), paragraphTextKeys (copy), getFFlagEnableAuditForSinglePageSignUp (copy), p4 (copy), registerAuditContentModule (copy), getFFlagEnableAuditForSso (copy), layoutOrder (copy), var2 (copy)
			local var3 = p6.Font.BaseSize * p6.Font.Title.RelativeSize
			local font = p6.Font.Title.Font
			local var4 = 12
			local var5 = p6.Font.BaseSize * p6.Font.Body.RelativeSize
			local font_1 = p6.Font.Body.Font
			
			if formFactor_1 == formFactor.COMPACT then
				var3 = p6.Font.BaseSize * p6.Font.Title.RelativeMinSize
				var4 = 5
				var5 = p6.Font.BaseSize * p6.Font.Body.RelativeMinSize
			end
			local var6 = 0
			local t = {
				Layout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, var4)
				}),
				Title = p5.titleText and roactModule.createElement(fitTextLabelModule, {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					TextWrapped = true,
					LayoutOrder = var6,
					TextXAlignment = textXAlignment,
					TextYAlignment = Enum.TextYAlignment.Top,
					Text = p5.titleText,
					TextSize = var3,
					Font = font,
					TextColor3 = p6.Theme.SystemPrimaryDefault.Color,
					TextTransparency = p6.Theme.SystemPrimaryDefault.Transparency,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = fitChildrenModule.FitAxis.Height
				})
			}
			
			for i, v in ipairs(paragraphTextKeys) do
				var6 += 1
				local text = "paragraphText" .. tostring(i)
				local var7 = p5[text]
				t[text] = roactModule.createElement(fitTextLabelModule, {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					TextWrapped = true,
					LayoutOrder = var6,
					TextXAlignment = textXAlignment,
					TextYAlignment = Enum.TextYAlignment.Top,
					Text = var7,
					TextSize = var5,
					Font = font_1,
					TextColor3 = p6.Theme.TextDefault.Color,
					TextTransparency = p6.Theme.TextDefault.Transparency,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = fitChildrenModule.FitAxis.Height
				})
				
				if getFFlagEnableAuditForSinglePageSignUp() and p4.props.enableAuditContentCapture and (registerAuditContentModule and var7) then
					local text_1 = "AuditContent_" .. text
					t[text_1] = roactModule.createElement(registerAuditContentModule, {
						translationKey = if type(v) == "table" then v[1] else v,
						translatedSourceString = if type(v) == "table" then if getFFlagEnableAuditForSso() then p5["paragraphTextTemplate" .. tostring(i)] else p5.verificationLinkingTextTemplate else var7,
						parameters = p4:getCachedParameters(text_1, v)
					})
				end
			end
			return roactModule.createElement(fitChildrenModule.FitFrame, {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = layoutOrder,
				Size = var2,
				fitAxis = fitChildrenModule.FitAxis.Height
			}, t)
		end)
	end)
end

return roactRoduxModule.connect(function(p5, _)
	return { formFactor = p5.FormFactor }
end)(titleAndParagraph)