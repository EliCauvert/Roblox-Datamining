local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local Parent = OnPlatformSurveys.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local DialogSize = FoundationModule.Enums.DialogSize
local FocusNavigableSurfaceIdentifierEnum = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseSurveyFocusRefsModule = require(OnPlatformSurveys.Hooks.useSurveyFocusRefs)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), UseScaledValueFunction (copy), UseSurveyFocusRefsModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), Sheet (copy), DialogSize (copy), Text (copy), View (copy)
	local IsIsOpen = p1.isOpen ~= false
	local OnClose = p1.onClose
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize.Y)
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(Frame.AbsoluteSize.Y)
	end, {})
	local NewUseScaledValueResult = (if p1.children then UseStateResult else 0) + UseScaledValueFunction(116) + (if p1.footer then UseStateResult1 else 0)
	
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		isOpen = IsIsOpen,
		onClose = OnClose,
		size = DialogSize.Large,
		centerSheetHeight = NewUseScaledValueResult,
		snapPoints = ReactModule.useMemo(function()
			-- upvalues: NewUseScaledValueResult (copy)
			return { NewUseScaledValueResult }
		end, { NewUseScaledValueResult }),
		ref = UseSurveyFocusRefsModule(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, OnClose)
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
			Title = p1.title and ReactModule.createElement(Text, {
				tag = "fill auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
				Text = p1.title
			}) or nil
		}),
		Content = ReactModule.createElement(Sheet.Content, {}, {
			Body = ReactModule.createElement(View, {
				tag = "col size-full-0 auto-y padding-bottom-small",
				onAbsoluteSizeChanged = UseResult
			}, p1.children)
		}),
		Actions = p1.footer and ReactModule.createElement(Sheet.Actions, {}, {
			Footer = ReactModule.createElement(View, {
				tag = "row size-full-0 auto-y",
				onAbsoluteSizeChanged = UseResult1
			}, p1.footer)
		}) or nil
	})
end)