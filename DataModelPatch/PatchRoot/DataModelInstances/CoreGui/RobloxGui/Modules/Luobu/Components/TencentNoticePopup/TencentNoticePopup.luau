local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local NoticePageControlModule = require(Modules.Luobu.Components.TencentNoticePopup.NoticePageControl)
local TModule = require(CorePackages.Packages.t)
local TencentNoticePopup = RoactModule.PureComponent:extend("TencentNoticePopup")
TencentNoticePopup.validateProps = TModule.strictInterface({
	noticeList = TModule.table,
	closePrompt = TModule.callback
})

function TencentNoticePopup.render(p1)
	-- upvalues: RoactModule (copy), NoticePageControlModule (copy)
	return RoactModule.createElement(NoticePageControlModule, {
		noticeList = p1.props.noticeList,
		onActivated = p1.props.closePrompt,
		settings = {
			widePopupWidth = 540,
			widePopupHeight = 268,
			headerHeight = 38,
			bottomHeight = 72,
			compactHeightToWidthRatio = 1.37614
		}
	})
end

return (RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy)
	return {
		closePrompt = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end
	}
end)(TencentNoticePopup))