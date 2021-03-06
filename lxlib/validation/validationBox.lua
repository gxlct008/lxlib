
local lx, _M, mt = oo{
    _cls_ = '',
    _ext_ = 'box'
}

local app, lf, tb, str, new = lx.kit()

function _M:reg()

    self:regDepends()

    self:regVerifier()
    self:regFactory()
end

function _M.__:regFactory()

    local factory = 'lxlib.validation.factory'

    app:single('validator', factory, function()

        local validator = new(factory, app.translator)
        local verifier = app:get('validation.verifier')
        if app:get('db') and verifier then
            validator:setVerifier(verifier)
        end
        
        return validator
    end)
end

function _M.__:regVerifier()

    app:single('validation.verifier', function()
        
        return new('lxlib.validation.dbVerifier', app:get('db'))
    end)
end

function _M.__:regDepends()
    
    app:bindFrom('lxlib.validation', {
        validateRequest             = 'validateRequest',
        validateWhenResolvedMix     = 'validateWhenResolvedMix',
    })
 
    app:bindFrom('lxlib.validation.excp', {
        validationException     = 'validationException',
        unauthorizedException   = 'unauthorizedException'
    })

    app:bond('verifierBond',                'lxlib.validation.bond.verifier')
    app:bond('validatorBond',               'lxlib.validation.bond.validator')
    app:bond('validateWhenResolvedBond',    'lxlib.validation.bond.validateWhenResolved')
end

function _M:boot()

end

return _M

