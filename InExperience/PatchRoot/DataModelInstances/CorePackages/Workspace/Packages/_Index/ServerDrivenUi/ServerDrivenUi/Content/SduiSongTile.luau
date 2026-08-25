local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local cryoModule = require(parent.Cryo)
local useSongAlbumArt = require(parent.Songbird).useSongAlbumArt
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local executeAction = sduiCoreSystemModule.executeAction
local sduiTileModule = require(serverDrivenUi.Content.SduiTile)
local sduiTileFooterModule = require(serverDrivenUi.Content.SduiTileFooter)

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), useSongAlbumArt (ref), reactModule (ref), sduiActionType (ref), executeAction (ref), sduiTileFooterModule (ref), sduiTileModule (ref), cryoModule (ref)
	local songId = p0.songId
	
	return reactModule.createElement(sduiTileModule, cryoModule.Dictionary.join(p0, {
		testId = "--sdui-song-tile",
		image = if p0.image and p0.image ~= "" then p0.image else useSongAlbumArt(songId).value,
		onActivated = reactModule.useCallback(function()
			-- upvalues: p0 (ref), sduiActionType (copy), songId (ref), executeAction (copy)
			if p0.onActivated then
				p0.onActivated()
				
				return
			end
			executeAction({
				actionType = sduiActionType.OpenSongDetail,
				actionParams = { songId = songId }
			}, p0.analyticsContext, p0.sduiContext)
		end, {
			p0.onActivated,
			p0.sduiContext,
			p0.analyticsContext,
			songId
		}),
		footerComponent = reactModule.useMemo(function()
			-- upvalues: p0 (ref), reactModule (copy), sduiTileFooterModule (copy)
			return if p0.footerComponent then p0.footerComponent else reactModule.createElement(sduiTileFooterModule, {
				testId = "--sdui-song-tile-footer-artist",
				leftText = p0.artistText
			})
		end, { p0.footerComponent, p0.artistText, useTokens() })
	}))
end)