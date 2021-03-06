<section class="tab-pane active" ng-if="globalService.currentTab==globalService.tabs.generateWallet.id" ng-controller='walletGenCtrl'>

  <!-- Top -->
  <h2> Generate Wallet生成钱包 </h2>

  @@if (site === 'mew' ) {
    <p>We removed the <a ng-click="globalService.currentTab=globalService.tabs.bulkGenerate.id"> Bulk Generate tab </a> from the nav as it wasn't very widely used, but feel free to still use it if you want.</p>
  }

  <article class="row">
    <div class="col-sm-6">
      <div class="form-group">
        <h4>Enter a strong password <small> (at least 9 characters)</small> </h4>
        <div class="input-group">
          <input type="{{showPass && 'password' || 'text'}}" class="form-control" placeholder="Don't forget to save this!不要忘记保存！" ng-model="password" ng-class="isStrongPass() ? 'valid' : 'invalid'"/>
          <span class="input-group-addon eye" ng-click="showPass=!showPass"></span>
        </div>
      </div>
    </div>
    <div class="col-sm-6">
      <div class="form-group">
        <h4>Generate Wallet </h4>
        <a class="btn btn-primary btn-block btnAction" func="generateSingleWallet" ng-click="genNewWallet()">GENERATE</a>
      </div>
    </div>
  </article>
  <!-- / Top -->

  <!-- Bottom - Display Generated Wallet -->
  <section id="generatedWallet" ng-show="showWallet">
    <hr />

    <!-- 0. Warning -->
    <h2>Success! Your wallet has been generated.</h2>
    <div class="alert alert-danger">
      <strong>You need your Keystore/JSON File & password or Private Key</strong> to access this wallet in the future.以后你使用钱包，需要用到Keystore文件、密码或者私钥。 Please save & back it up externally!请保存、备份钱包！ There is no way to recover a wallet if you do not save it. 如果你没有保存钱包，没有办法恢复钱包。Read the <a href="https://www.myetherwallet.com/#help" target="_blank">help page</a> for instructions.请阅读帮助页面获得更多信息。
    </div>
    <!-- / 0. Warning -->

    <!-- 1. Private Keys -->
    <h4> 1. Save your Keystore/JSON or Private Key. Don't forget your password above.1.保存你的Keystore/JSON或者私钥。不要忘记秘密。 </h4>
    <div class="row">
      <div class="col-sm-6">
        <div class="form-group">
          <label>
            Keystore/JSON File <small>(Encrypted &middot; Mist/Geth Format &middot; Recommended)</small>
            <div class="account-help-icon">
              <svg version="1.1" width="20px" height="20px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 92 92" style="enable-background:new 0 0 92 92;" xml:space="preserve"><path fill="#2bb2dd" d="M45.386,0.004C19.983,0.344-0.333,21.215,0.005,46.619c0.34,25.393,21.209,45.715,46.611,45.377 c25.398-0.342,45.718-21.213,45.38-46.615C91.656,19.986,70.786-0.335,45.386,0.004z M45.25,74l-0.254-0.004 c-3.912-0.116-6.67-2.998-6.559-6.852c0.109-3.788,2.934-6.538,6.717-6.538l0.227,0.004c4.021,0.119,6.748,2.972,6.635,6.937 C51.904,71.346,49.123,74,45.25,74z M61.705,41.341c-0.92,1.307-2.943,2.93-5.492,4.916l-2.807,1.938 c-1.541,1.198-2.471,2.325-2.82,3.434c-0.275,0.873-0.41,1.104-0.434,2.88l-0.004,0.451H39.43l0.031-0.907 c0.131-3.728,0.223-5.921,1.768-7.733c2.424-2.846,7.771-6.289,7.998-6.435c0.766-0.577,1.412-1.234,1.893-1.936 c1.125-1.551,1.623-2.772,1.623-3.972c0-1.665-0.494-3.205-1.471-4.576c-0.939-1.323-2.723-1.993-5.303-1.993 c-2.559,0-4.311,0.812-5.359,2.478c-1.078,1.713-1.623,3.512-1.623,5.35v0.457H27.936l0.02-0.477 c0.285-6.769,2.701-11.643,7.178-14.487C37.947,18.918,41.447,18,45.531,18c5.346,0,9.859,1.299,13.412,3.861 c3.6,2.596,5.426,6.484,5.426,11.556C64.369,36.254,63.473,38.919,61.705,41.341z"/></svg>
              <span class="account-help-text">This Keystore / JSON file matches the format used by Mist & Geth so you can easily import it in the future.Keystore/JSON文件与Mist、Geth使用的文件是一致的，所以你可以很容易导入到Mist、Geth钱包。 It is the recommended file to download and back up.推荐你使用该文件格式进行下载和备份钱包</span>
            </div>
          </label>
          <a class="btn btn-info btn-block" href="{{blobEnc}}" download="{{encFileName}}"> DOWNLOAD下载 </a>
        </div>
        <div class="form-group">
          <label>
            JSON File JSON文件 <small>(unencrypted)（未加密）</small>
            <div class="account-help-icon">
              <svg version="1.1" width="20px" height="20px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 92 92" style="enable-background:new 0 0 92 92;" xml:space="preserve"><path fill="#2bb2dd" d="M45.386,0.004C19.983,0.344-0.333,21.215,0.005,46.619c0.34,25.393,21.209,45.715,46.611,45.377 c25.398-0.342,45.718-21.213,45.38-46.615C91.656,19.986,70.786-0.335,45.386,0.004z M45.25,74l-0.254-0.004 c-3.912-0.116-6.67-2.998-6.559-6.852c0.109-3.788,2.934-6.538,6.717-6.538l0.227,0.004c4.021,0.119,6.748,2.972,6.635,6.937 C51.904,71.346,49.123,74,45.25,74z M61.705,41.341c-0.92,1.307-2.943,2.93-5.492,4.916l-2.807,1.938 c-1.541,1.198-2.471,2.325-2.82,3.434c-0.275,0.873-0.41,1.104-0.434,2.88l-0.004,0.451H39.43l0.031-0.907 c0.131-3.728,0.223-5.921,1.768-7.733c2.424-2.846,7.771-6.289,7.998-6.435c0.766-0.577,1.412-1.234,1.893-1.936 c1.125-1.551,1.623-2.772,1.623-3.972c0-1.665-0.494-3.205-1.471-4.576c-0.939-1.323-2.723-1.993-5.303-1.993 c-2.559,0-4.311,0.812-5.359,2.478c-1.078,1.713-1.623,3.512-1.623,5.35v0.457H27.936l0.02-0.477 c0.285-6.769,2.701-11.643,7.178-14.487C37.947,18.918,41.447,18,45.531,18c5.346,0,9.859,1.299,13.412,3.861 c3.6,2.596,5.426,6.484,5.426,11.556C64.369,36.254,63.473,38.919,61.705,41.341z"/></svg>
              <span class="account-help-text">This is the unencrypted, JSON format of your private key.这是未加密的JSON格式私钥。这意味着你不需要秘密，但是任何得到这个JSON文件的人无需密码就可以获得你的钱包和以太币。 This means you do not need the password but anyone who finds your JSON can access your wallet & Ether without the password.</span>
            </div>
          </label>
          <a class="btn btn-info btn-block" href="{{blob}}" download="{{wallet.getChecksumAddressString()}}-unencrypted.json">DOWNLOAD下载</a>
        </div>
      </div><!-- end col-sm-6-->
      <div class="col-sm-6">
        <div class="form-group">
          <label>
            Private Key私钥 <small>(unencrypted)（未加密）</small>
            <div class="account-help-icon">
              <svg version="1.1" width="20px" height="20px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 92 92" style="enable-background:new 0 0 92 92;" xml:space="preserve"><path fill="#2bb2dd" d="M45.386,0.004C19.983,0.344-0.333,21.215,0.005,46.619c0.34,25.393,21.209,45.715,46.611,45.377 c25.398-0.342,45.718-21.213,45.38-46.615C91.656,19.986,70.786-0.335,45.386,0.004z M45.25,74l-0.254-0.004 c-3.912-0.116-6.67-2.998-6.559-6.852c0.109-3.788,2.934-6.538,6.717-6.538l0.227,0.004c4.021,0.119,6.748,2.972,6.635,6.937 C51.904,71.346,49.123,74,45.25,74z M61.705,41.341c-0.92,1.307-2.943,2.93-5.492,4.916l-2.807,1.938 c-1.541,1.198-2.471,2.325-2.82,3.434c-0.275,0.873-0.41,1.104-0.434,2.88l-0.004,0.451H39.43l0.031-0.907 c0.131-3.728,0.223-5.921,1.768-7.733c2.424-2.846,7.771-6.289,7.998-6.435c0.766-0.577,1.412-1.234,1.893-1.936 c1.125-1.551,1.623-2.772,1.623-3.972c0-1.665-0.494-3.205-1.471-4.576c-0.939-1.323-2.723-1.993-5.303-1.993 c-2.559,0-4.311,0.812-5.359,2.478c-1.078,1.713-1.623,3.512-1.623,5.35v0.457H27.936l0.02-0.477 c0.285-6.769,2.701-11.643,7.178-14.487C37.947,18.918,41.447,18,45.531,18c5.346,0,9.859,1.299,13.412,3.861 c3.6,2.596,5.426,6.484,5.426,11.556C64.369,36.254,63.473,38.919,61.705,41.341z"/></svg>
              <span class="account-help-text">This is the unencrypted text version of your private key, meaning no password is necessary. 这是未加密的文字格式私钥，不需要密码。If someone were to find your unencrypted private key, they could access your wallet without a password.如果有人得到你的未加密私钥，他们无需密码就可以获得你的钱包。 For this reason, encrypted versions are typically recommended.出于这个原因，推荐使用加密格式钱包。</span>
            </div>
          </label>
          <textarea class="form-control bigger-on-mobile" type="text" readonly="readonly">{{wallet.getPrivateKeyString()}}</textarea>
        </div>
      </div><!-- end col-sm-6-->
    </div><!-- end row -->
    <!-- / 1. Private Keys -->

    <hr />

    <!-- 2. Address -->
    <div class="row">
      <div class="col-sm-10">
        <div class="form-group">
          <h4>2. Save Your Address.保存你的地址。
            <div class="account-help-icon"><svg version="1.1" width="20px" height="20px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 92 92" style="enable-background:new 0 0 92 92;" xml:space="preserve"><path fill="#2bb2dd" d="M45.386,0.004C19.983,0.344-0.333,21.215,0.005,46.619c0.34,25.393,21.209,45.715,46.611,45.377 c25.398-0.342,45.718-21.213,45.38-46.615C91.656,19.986,70.786-0.335,45.386,0.004z M45.25,74l-0.254-0.004 c-3.912-0.116-6.67-2.998-6.559-6.852c0.109-3.788,2.934-6.538,6.717-6.538l0.227,0.004c4.021,0.119,6.748,2.972,6.635,6.937 C51.904,71.346,49.123,74,45.25,74z M61.705,41.341c-0.92,1.307-2.943,2.93-5.492,4.916l-2.807,1.938 c-1.541,1.198-2.471,2.325-2.82,3.434c-0.275,0.873-0.41,1.104-0.434,2.88l-0.004,0.451H39.43l0.031-0.907 c0.131-3.728,0.223-5.921,1.768-7.733c2.424-2.846,7.771-6.289,7.998-6.435c0.766-0.577,1.412-1.234,1.893-1.936 c1.125-1.551,1.623-2.772,1.623-3.972c0-1.665-0.494-3.205-1.471-4.576c-0.939-1.323-2.723-1.993-5.303-1.993 c-2.559,0-4.311,0.812-5.359,2.478c-1.078,1.713-1.623,3.512-1.623,5.35v0.457H27.936l0.02-0.477 c0.285-6.769,2.701-11.643,7.178-14.487C37.947,18.918,41.447,18,45.531,18c5.346,0,9.859,1.299,13.412,3.861 c3.6,2.596,5.426,6.484,5.426,11.556C64.369,36.254,63.473,38.919,61.705,41.341z"/></svg>
            <span class="account-help-text">You may know this as your "Account #" or your "Public Key".你可以把它理解成“账户”或者“公钥”。 It's what you send people so they can send you ETH.告诉别人你的账户，他们就可以向你发送以太币。 That icon is an easy way to recognize your address.图标有助于识别你的地址。</span></div>
          </h4>
          <input class="form-control" type="text" readonly="readonly" ng-value="wallet.getChecksumAddressString()"/>
        </div>
      </div>
      <div class="col-sm-2 address-identicon-container">
        <div id="addressIdenticon" title="Address Indenticon" blockie-address="{{wallet.getAddressString()}}" watch-var="wallet"></div>
      </div>
    </div>
    <!-- / 2. Address -->

    <!-- 3. Extras -->
    <div class="row">
      <div class="col-xs-12">
        <hr />
        <h4> 3. Print your paper wallet, or store a QR code verison. (optional)3.打印纸钱包，或者保存钱包二维码。</h4>
      </div>
    </div>

    <div class="row">
      <div class="col-sm-6">
        <div class="form-group">
          <label>
            Print Paper Wallet:打印纸钱包
            <div class="account-help-icon">
              <svg version="1.1" width="20px" height="20px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 92 92" style="enable-background:new 0 0 92 92;" xml:space="preserve"><path fill="#2bb2dd" d="M45.386,0.004C19.983,0.344-0.333,21.215,0.005,46.619c0.34,25.393,21.209,45.715,46.611,45.377 c25.398-0.342,45.718-21.213,45.38-46.615C91.656,19.986,70.786-0.335,45.386,0.004z M45.25,74l-0.254-0.004 c-3.912-0.116-6.67-2.998-6.559-6.852c0.109-3.788,2.934-6.538,6.717-6.538l0.227,0.004c4.021,0.119,6.748,2.972,6.635,6.937 C51.904,71.346,49.123,74,45.25,74z M61.705,41.341c-0.92,1.307-2.943,2.93-5.492,4.916l-2.807,1.938 c-1.541,1.198-2.471,2.325-2.82,3.434c-0.275,0.873-0.41,1.104-0.434,2.88l-0.004,0.451H39.43l0.031-0.907 c0.131-3.728,0.223-5.921,1.768-7.733c2.424-2.846,7.771-6.289,7.998-6.435c0.766-0.577,1.412-1.234,1.893-1.936 c1.125-1.551,1.623-2.772,1.623-3.972c0-1.665-0.494-3.205-1.471-4.576c-0.939-1.323-2.723-1.993-5.303-1.993 c-2.559,0-4.311,0.812-5.359,2.478c-1.078,1.713-1.623,3.512-1.623,5.35v0.457H27.936l0.02-0.477 c0.285-6.769,2.701-11.643,7.178-14.487C37.947,18.918,41.447,18,45.531,18c5.346,0,9.859,1.299,13.412,3.861 c3.6,2.596,5.426,6.484,5.426,11.556C64.369,36.254,63.473,38.919,61.705,41.341z"/></svg>
              <span class="account-help-text">ProTip: Click print and save this as a PDF, even if you do not own a printer!技巧：点击打印，以PDF格式保存它，即使你没有打印机也这样做！</span>
            </div>
          </label>
          <a class="btn btn-info btn-block btnAction" ng-click="printQRCode()">PRINT</a>
        </div>
      </div>

      <div class="form-group col-sm-3">
        <label>Your Address:</label>
        <div qr-code="{{wallet.getAddressString()}}" watch-var="wallet" width="100%"></div>
      </div>
      <div class="form-group col-sm-3">
        <label>Private Key (unencrypted):</label>
        <div qr-code="{{wallet.getPrivateKeyString()}}" watch-var="wallet" width="100%"></div>
      </div>
    </div>
  <!-- /3. Extras -->




  </section>
</section>
<!-- / wallet generator -->
