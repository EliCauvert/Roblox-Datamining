local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local _ = require(AmpV2Wizard.Types)
local FullPageChromeModule = require(AmpV2Wizard.FullPageChrome)
local CodeInputModule = require(AmpV2Wizard.CodeInput)
local OdpAnalyticsModule = require(AmpV2Wizard.OdpAnalytics)

return function(p1)
	-- upvalues: OdpAnalyticsModule (copy), ReactModule (copy), View (copy), Text (copy), CodeInputModule (copy), FullPageChromeModule (copy)
	local Props = p1.props
	local ReportFunction = p1.report
	local Transitions = p1.transitions
	local UseOdpAnalyticsResult = OdpAnalyticsModule.useOdpAnalytics(p1.ctx)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), UseOdpAnalyticsResult (copy)
		if not UseRefResult2.current then
			UseRefResult2.current = true
			UseOdpAnalyticsResult.pinEntryShown()
		end
	end, { UseOdpAnalyticsResult })
	local UseRefResult3 = ReactModule.useRef(0)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), UseRefResult (copy), UseRefResult3 (copy)
		UseStateResult2("")
		UseStateResult2_1(false)
		UseRefResult.current = false
		UseRefResult3.current = 0
	end, { Props })
	local UseRefResult4 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult4 (copy), Props (copy), UseOdpAnalyticsResult (copy)
		if UseRefResult4.current == Props then return end
		UseRefResult4.current = Props
		
		if Props.error ~= nil and Props.error ~= "" then
			UseOdpAnalyticsResult.pinEntryIncorrect()
		end
	end, { Props, UseOdpAnalyticsResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), ReportFunction (copy)
		local Current = UseRefResult1.current
		
		if Current ~= nil then
			Current.releaseFocus()
		end
		ReportFunction("Back")
	end, { ReportFunction })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), ReportFunction (copy)
		local Current = UseRefResult1.current
		
		if Current ~= nil then
			Current.releaseFocus()
		end
		ReportFunction("Cancel")
	end, { ReportFunction })
	
	return ReactModule.createElement(FullPageChromeModule, {
		title = Props.headerTitle,
		onBack = if Transitions == nil or Transitions.Back == nil then nil else UseResult,
		onClose = if Transitions == nil or Transitions.Back ~= nil or Transitions.Cancel == nil then nil else UseResult1
	}, {
		Content = ReactModule.createElement(View, {
			tag = "col gap-xlarge size-full-0 auto-y padding-y-xlarge"
		}, {
			Copy = ReactModule.createElement(View, {
				tag = "col gap-none size-full-0 auto-y padding-x-xlarge",
				LayoutOrder = 1
			}, {
				Title = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-heading-medium text-wrap text-align-x-left content-emphasis",
					LayoutOrder = 1,
					Text = Props.title
				}),
				Description = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-left content-default",
					LayoutOrder = 2,
					Text = Props.description
				}),
				ForgotPin = ReactModule.createElement(Text, {
					RichText = true,
					tag = "auto-xy text-body-large text-align-x-left content-default",
					LayoutOrder = 3,
					Text = `<u>{Props.forgotPinLabel}</u>`,
					onActivated = ReactModule.useCallback(function()
						-- upvalues: UseRefResult1 (copy), UseOdpAnalyticsResult (copy), ReportFunction (copy)
						local Current = UseRefResult1.current
						
						if Current ~= nil then
							Current.releaseFocus()
						end
						UseOdpAnalyticsResult.pinEntryForgotPin()
						ReportFunction("ForgotPin")
					end, { ReportFunction, UseOdpAnalyticsResult })
				})
			}),
			Field = ReactModule.createElement(View, {
				tag = "col gap-none size-full-0 auto-y padding-x-xlarge",
				LayoutOrder = 2
			}, {
				Label = ReactModule.createElement(View, {
					tag = "row flex-between align-y-center gap-xsmall size-full-0 auto-y padding-bottom-small",
					LayoutOrder = 1
				}, {
					InputLabel = ReactModule.createElement(Text, {
						tag = "auto-xy text-title-medium text-align-x-left content-emphasis",
						LayoutOrder = 1,
						Text = Props.inputLabel
					}),
					RevealToggle = ReactModule.createElement(Text, {
						tag = "auto-xy text-title-medium content-default",
						LayoutOrder = 2,
						Text = if UseStateResult1 then Props.hidePinLabel else Props.showPinLabel,
						onActivated = ReactModule.useCallback(function()
							-- upvalues: UseRefResult (copy), UseOdpAnalyticsResult (copy), UseStateResult2_1 (copy)
							local NoCurrent = not UseRefResult.current
							UseRefResult.current = NoCurrent
							UseOdpAnalyticsResult.pinEntryRevealToggled(NoCurrent)
							UseStateResult2_1(NoCurrent)
						end, { UseOdpAnalyticsResult })
					})
				}),
				Input = ReactModule.createElement(CodeInputModule, {
					length = 6,
					LayoutOrder = 2,
					value = UseStateResult,
					onChanged = ReactModule.useCallback(function(p2)
						-- upvalues: UseRefResult3 (copy), UseOdpAnalyticsResult (copy), UseStateResult2 (copy)
						if #p2 ~= UseRefResult3.current then
							UseRefResult3.current = #p2
							UseOdpAnalyticsResult.pinEntryDigitsChanged(#p2)
						end
						UseStateResult2(p2)
					end, { UseOdpAnalyticsResult }),
					onComplete = ReactModule.useCallback(function(Pin)
						-- upvalues: ReportFunction (copy)
						ReportFunction("Success", { pin = Pin })
					end, { ReportFunction }),
					isMasked = not UseStateResult1,
					controlRef = UseRefResult1
				}),
				Error = if Props.error == nil or Props.error == "" then nil else ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y padding-top-small text-body-small text-wrap text-align-x-left content-system-alert",
					LayoutOrder = 3,
					Text = Props.error
				})
			})
		})
	})
end