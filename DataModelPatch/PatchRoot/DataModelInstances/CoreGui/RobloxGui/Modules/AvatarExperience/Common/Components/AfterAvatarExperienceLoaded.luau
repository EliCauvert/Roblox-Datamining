local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local RetrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local AvatarExperienceLoaded = RoactModule.PureComponent:extend("AvatarExperienceLoaded")
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState)
AvatarExperienceLoaded.validateProps = TModule.strictInterface({
	showLoadingBar = TModule.boolean,
	[RoactModule.Children] = TModule.optional(TModule.table),
	avatarExperienceLoaded = TModule.boolean
})

function AvatarExperienceLoaded.init(p1)
	function p1.emptyRenderFunction()
		return nil
	end
end

function AvatarExperienceLoaded.getLoadingStatus(p1)
	-- upvalues: RetrievalStatus (copy)
	return if p1.props.avatarExperienceLoaded then RetrievalStatus.Done else RetrievalStatus.Fetching
end

function AvatarExperienceLoaded.render(p1)
	-- upvalues: RoactModule (copy), LoadingStateContainer (copy)
	return RoactModule.createElement(LoadingStateContainer, {
		dataStatus = p1:getLoadingStatus(),
		renderOnLoaded = function()
			-- upvalues: RoactModule (upval), p1 (copy)
			return RoactModule.oneChild(p1.props[RoactModule.Children])
		end,
		renderOnLoading = if p1.props.showLoadingBar then nil else p1.emptyRenderFunction
	})
end

local v1 = RoactRoduxModule.connect(function(p1, _)
	return {
		avatarExperienceLoaded = p1.AvatarExperience.Common.AvatarExperienceLoaded
	}
end, nil)(AvatarExperienceLoaded)

return function(p1, ShowLoadingBar: boolean)
	-- upvalues: RoactModule (copy), v1 (ref)
	if ShowLoadingBar == nil then
		ShowLoadingBar = true
	end
	return function(p2)
		-- upvalues: RoactModule (upval), v1 (upval), ShowLoadingBar (ref), p1 (copy)
		return RoactModule.createElement(v1, { showLoadingBar = ShowLoadingBar }, { Child = RoactModule.createElement(p1, p2) })
	end
end