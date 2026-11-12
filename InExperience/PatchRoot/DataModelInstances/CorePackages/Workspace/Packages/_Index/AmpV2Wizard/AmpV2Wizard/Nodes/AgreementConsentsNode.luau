local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local Checkbox = FoundationModule.Checkbox
local Divider = FoundationModule.Divider
local InputLabel = FoundationModule.InputLabel
local ScrollView = FoundationModule.ScrollView
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local InlineRichTextModule = require(Parent.InlineRichText)
local Renderer = InlineRichTextModule.Renderer
local LinkBehavior = InlineRichTextModule.Enums.LinkBehavior
local PrepareRichTextCopyFunction = InlineRichTextModule.prepareRichTextCopy
local _ = require(AmpV2Wizard.Types)
local FullPageChromeModule = require(AmpV2Wizard.FullPageChrome)

local function renderRow(p1, LayoutOrder)
	-- upvalues: ReactModule (copy), View (copy), Checkbox (copy), InputSize (copy), Renderer (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-top gap-medium size-full-0 auto-y",
		LayoutOrder = LayoutOrder
	}, {
		Check = ReactModule.createElement(Checkbox, {
			label = "",
			LayoutOrder = 1,
			isChecked = p1.checked[LayoutOrder] == true,
			onActivated = function()
				-- upvalues: p1 (copy), LayoutOrder (copy)
				p1.toggleRow(LayoutOrder)
			end,
			size = InputSize.Medium,
			testId = `amp-v2-wizard-consent-row-{LayoutOrder}`
		}),
		Label = ReactModule.createElement(Renderer, {
			text = p1.labels[LayoutOrder],
			textStyle = p1.textStyle,
			fontStyle = p1.fontStyle,
			linkerOptions = p1.linkerOptions,
			wrapperProps = {
				tag = "fill size-full-0 auto-y",
				LayoutOrder = 2,
				selection = { Selectable = false },
				onActivated = function()
					-- upvalues: p1 (copy), LayoutOrder (copy)
					p1.toggleRow(LayoutOrder)
				end
			},
			nodeProps = { LINK = { showUnderline = true } }
		})
	})
end

local function renderSection(p1, Text, IsRequired, LayoutOrder)
	-- upvalues: renderRow (copy), ReactModule (copy), View (copy), InputLabel (copy)
	local t = {}
	
	for i, row in p1.rows do
		if row.isRequired == IsRequired then
			t[`Row_{i}`] = renderRow(p1, i)
		end
	end
	return if next(t) == nil then nil else ReactModule.createElement(View, {
		tag = "col gap-large size-full-0 auto-y",
		LayoutOrder = LayoutOrder
	}, {
		SectionLabel = ReactModule.createElement(InputLabel, { LayoutOrder = 1, Text = Text }),
		Rows = ReactModule.createElement(View, {
			tag = "col gap-medium size-full-0 auto-y",
			LayoutOrder = 2
		}, t)
	})
end

return function(p2)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), LinkBehavior (copy), PrepareRichTextCopyFunction (copy), View (copy), ScrollView (copy), Text (copy), Checkbox (copy), InputSize (copy), Divider (copy), renderSection (copy), Button (copy), ButtonVariant (copy), FullPageChromeModule (copy)
	local Props = p2.props
	local ReportFunction = p2.report
	local UseTokensResult = UseTokensFunction()
	local Rows = Props.rows or {}
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local Count = 0
	local Count1 = 0
	local Count2 = 0
	
	for i, row in Rows do
		local IsUseStateResultEntry = UseStateResult[i] == true
		
		if IsUseStateResultEntry then
			Count2 += 1
		end
		if row.isRequired then
			Count += 1
			
			if IsUseStateResultEntry then
				Count1 += 1
			end
		end
	end
	local IsCountMatch: boolean = #Rows > 0 and Count2 == #Rows
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: ReportFunction (copy)
		ReportFunction("Back")
	end, { ReportFunction })
	local config = {
		rows = Rows,
		labels = ReactModule.useMemo(function()
			-- upvalues: Rows (copy), PrepareRichTextCopyFunction (upval)
			local t = {}
			
			for i, row in Rows do
				t[i] = if type(row.label) == "string" then PrepareRichTextCopyFunction(row.label) else ""
			end
			return t
		end, { Rows }),
		checked = UseStateResult,
		toggleRow = ReactModule.useCallback(function(p3)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(Tbl)
				-- upvalues: p3 (copy)
				local Copy = table.clone(Tbl)
				Copy[p3] = not Tbl[p3]
				
				return Copy
			end)
		end, {}),
		linkerOptions = ReactModule.useMemo(function()
			-- upvalues: LinkBehavior (upval)
			return {
				evaluateLinkBehavior = function()
					-- upvalues: LinkBehavior (upval)
					return LinkBehavior.Webview
				end
			}
		end, {}),
		textStyle = UseTokensResult.Color.Content.Emphasis,
		fontStyle = UseTokensResult.Typography.BodyMedium
	}
	local HasBack: boolean = p2.transitions ~= nil and p2.transitions.Back ~= nil
	
	return ReactModule.createElement(FullPageChromeModule, {
		title = Props.headerTitle,
		onBack = if HasBack then UseResult else nil
	}, {
		Content = ReactModule.createElement(View, { tag = "col size-full" }, {
			Body = ReactModule.createElement(ScrollView, {
				LayoutOrder = 1,
				flexItem = { FlexMode = Enum.UIFlexMode.Fill },
				Size = UDim2.fromScale(1, 0),
				scroll = {
					ScrollingDirection = Enum.ScrollingDirection.Y,
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(0, 1)
				}
			}, {
				Content = ReactModule.createElement(View, {
					tag = "col gap-xlarge size-full-0 auto-y padding-x-xlarge padding-y-xlarge"
				}, {
					Intro = ReactModule.createElement(View, { tag = "col gap-none size-full-0 auto-y", LayoutOrder = 1 }, {
						Title = ReactModule.createElement(Text, {
							tag = "size-full-0 auto-y text-heading-medium text-wrap text-align-x-left text-align-y-top content-emphasis",
							LayoutOrder = 1,
							Text = Props.title
						}),
						Description = ReactModule.createElement(Text, {
							tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-left text-align-y-top content-default",
							LayoutOrder = 2,
							Text = Props.description
						})
					}),
					ConsentToAll = ReactModule.createElement(Checkbox, {
						testId = "amp-v2-wizard-consent-all",
						LayoutOrder = 2,
						label = Props.consentToAllLabel,
						isChecked = IsCountMatch,
						onActivated = ReactModule.useCallback(function()
							-- upvalues: IsCountMatch (copy), Rows (copy), UseStateResult2 (copy)
							local NoIsCountMatch = not IsCountMatch
							local t = {}
							
							for row in Rows do
								t[row] = NoIsCountMatch
							end
							UseStateResult2(t)
						end, { IsCountMatch, Rows }),
						size = InputSize.Medium
					}),
					Separator = ReactModule.createElement(Divider, { LayoutOrder = 3 }),
					Required = renderSection(config, Props.requiredSectionLabel, true, 4),
					Optional = renderSection(config, Props.optionalSectionLabel, false, 5)
				})
			}),
			Footer = ReactModule.createElement(View, {
				tag = "col gap-small size-full-0 auto-y padding-x-xlarge padding-bottom-large",
				LayoutOrder = 2
			}, {
				Agree = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					text = Props.agreeLabel,
					onActivated = ReactModule.useCallback(function()
						-- upvalues: Rows (copy), UseStateResult (copy), ReportFunction (copy)
						local AcceptedRows = {}
						
						for i, row in Rows do
							if UseStateResult[i] then
								table.insert(AcceptedRows, { id = row.id, target = row.target })
							end
						end
						ReportFunction("Agree", { acceptedRows = AcceptedRows })
					end, { Rows, UseStateResult, ReportFunction }),
					isDisabled = not (Count1 == Count),
					variant = ButtonVariant.Emphasis,
					size = InputSize.Medium,
					width = UDim.new(1, 0)
				})
			})
		})
	})
end