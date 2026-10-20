local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local DropdownWithPopover = require(Parent.AuthCommon).Components.DropdownWithPopover
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)

return function(Frame)
	-- upvalues: ReactModule (copy), View (copy), DropdownWithPopover (copy)
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col gap-small",
		LayoutOrder = Frame.LayoutOrder
	}, {
		DropdownMenuContainer = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y col gap-small",
			LayoutOrder = 1,
			ZIndex = 3
		}, {
			DropdownWithPopover = ReactModule.createElement(DropdownWithPopover, {
				errorState = false,
				layoutOrder = 1,
				value = Frame.value,
				onChange = Frame.onChange,
				cellDatas = ReactModule.useMemo(function()
					-- upvalues: Frame (copy)
					if not Frame.phonePrefixList or #Frame.phonePrefixList <= 0 then
						return {}
					end
					local List = {}
					
					for Value, value in ipairs(Frame.phonePrefixList) do
						table.insert(List, {
							value = Value,
							text = string.format("%s (+%s)", value.localizedName, value.prefix or "")
						})
					end
					return List
				end, { Frame.phonePrefixList }),
				topOffset = Frame.topOffset
			})
		})
	})
end