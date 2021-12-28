<template>
  <div>
    <b-container>
      <h2>แบบฟอร์มขอใช้งาน OPS</h2>

      <b-form @submit="onSubmit" @reset="onReset" v-if="show">
        <h3>ข้อมูลบริษัท/หน่วยงาน</h3>
        <b-form-group
          id="compname"
          label="ชื่อบริษัท/หน่วยงาน:"
          label-for="compname"
        >
          <b-form-input
            id="compname"
            v-model="contact.compname"
            type="text"
            required
          ></b-form-input>
        </b-form-group>

        <b-form-group
          id="taxid"
          label="เลขประจำตัวผู้เสียภาษี:"
          label-for="taxid"
        >
          <b-form-input
            id="taxid"
            v-model="contact.taxid"
            type="text"
            required
          ></b-form-input>
        </b-form-group>

        <b-form-group id="name" label="ชื่อผู้ติดต่อ:" label-for="name">
          <b-form-input
            id="name"
            v-model="contact.name"
            type="text"
            required
          ></b-form-input>
        </b-form-group>

        <b-form-group id="tel" label="เบอร์ผู้ติดต่อ:" label-for="tel">
          <b-form-input
            id="tel"
            type="text"
            v-model="contact.tel"
            required
          ></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-3" label="Address:" label-for="input-3">
          <b-form-textarea
            id="address"
            v-model="contact.address"
          ></b-form-textarea>
        </b-form-group>

        <h3>รายละเอียดบัญชีเพื่อใช้ในการโอนเงิน</h3>
        <!-- รายละเอียดที่ใช้ในการโอนเงิน -->
        <b-form-group id="bankname" label="ชื่อธนาคาร:" label-for="compname">
          <b-form-input
            id="bankname"
            v-model="payment.bankname"
            type="text"
            required
          ></b-form-input>
        </b-form-group>

        <b-form-group id="accname" label="ชื่อบัญชี:" label-for="accname">
          <b-form-input
            id="accname"
            type="text"
            v-model="payment.accname"
            required
          ></b-form-input>
        </b-form-group>

        <b-form-group id="acctype" label="ประเภทบัญชี:" label-for="acctype">
          <b-form-input
            id="acctype"
            type="text"
            v-model="payment.acctype"
            required
          ></b-form-input>
        </b-form-group>

        <b-form-group id="accno" label="เลขที่บัญชี:" label-for="accno">
          <b-form-input
            id="accno"
            type="text"
            v-model="payment.accno"
            required
          ></b-form-input>
        </b-form-group>

        <b-form-group id="accbranch" label="สาขา:" label-for="accbranch">
          <b-form-input
            id="accbranch"
            type="text"
            v-model="payment.accbranch"
            required
          ></b-form-input>
        </b-form-group>
        <h3>ข้อมูลผู้ติดต่อ (ประสานงาน)</h3>
        <!-- ข้อมูลผู้ติดต่อ(ประสานงาน) -->
        <b-form-group
          id="namecoordinate"
          label="ชื่อ:"
          label-for="namecoordinate"
        >
          <b-form-input
            id="namecoordinate"
            type="text"
            v-model="coordinate.name"
            required
          ></b-form-input>
        </b-form-group>
        <!-- email -->
        <b-form-group
          id="emailcoordinate"
          label="E-mail:"
          label-for="emailcoordinate"
        >
          <b-form-input
            id="emailcoordinate"
            type="text"
            v-model="coordinate.email"
            required
          ></b-form-input>
        </b-form-group>
        <!-- Tel -->
        <b-form-group
          id="telcoordinate"
          label="เบอร์โทรศัพท์:"
          label-for="telcoordinate"
        >
          <b-form-input
            id="telcoordinate"
            type="text"
            v-model="coordinate.tel"
            required
          ></b-form-input>
        </b-form-group>

        <h3>ข้อมูลผู้ติดต่อ (การเงิน)</h3>
        <!-- ข้อมูลผู้ติดต่อ(การเงิน) -->
        <b-form-group id="namefinance" label="ชื่อ:" label-for="namefinance">
          <b-form-input
            id="namefinance"
            type="text"
            v-model="finance.name"
            required
          ></b-form-input>
        </b-form-group>
        <!-- email -->
        <b-form-group
          id="emailfinance"
          label="E-mail:"
          label-for="emailfinance"
        >
          <b-form-input
            id="emailfinance"
            type="text"
            v-model="finance.email"
            required
          ></b-form-input>
        </b-form-group>
        <!-- Tel -->
        <b-form-group
          id="telfinance"
          label="เบอร์โทรศัพท์:"
          label-for="telfinance"
        >
          <b-form-input
            id="telfinance"
            type="text"
            v-model="finance.tel"
            required
          ></b-form-input>
        </b-form-group>

        <!-- เงื่อนไขและรายละเอียดบริการ -->
        <h3>เงื่อนไขและรายละเอียดบริการ</h3>

        <b-form-group
          id="fee"
          label="ค่าธรรมเนียมการสมัคร/สอบ:"
          label-for="fee"
        >
          <b-form-input
            id="fee"
            type="number"
            v-model="details.registerfee"
            required
          ></b-form-input>
        </b-form-group>
        <!-- fee system -->
        <b-form-group
          id="system-fee"
          label="ค่าธรรมเนียมระบบ:"
          label-for="system-fee"
        >
          <b-form-input
            id="system-fee"
            type="number"
            v-model="details.systemfee"
            required
          ></b-form-input>
        </b-form-group>
        <!-- Row for date -->
        <h4>ระยะเวลาเปิดรับสมัคร</h4>
        <b-row>
          <!-- start date -->

          <b-col
            ><label for="start-date">ตั้งแต่วันที่</label>
            <b-input-group class="mb-3">
              <b-form-input
                id="start-date"
                v-model="details.registerstart"
                type="text"
                placeholder="YYYY-MM-DD"
                autocomplete="off"
              ></b-form-input>
              <b-input-group-append>
                <b-form-datepicker
                  v-model="details.registerstart"
                  button-only
                  right
                  locale="en-US"
                  aria-controls="start-date"
                ></b-form-datepicker>
              </b-input-group-append> </b-input-group
          ></b-col>
          <!-- End date -->
          <b-col
            ><label for="end-date">จนถึงวันที่:</label>
            <b-input-group class="mb-3">
              <b-form-input
                id="end-date"
                v-model="details.registerend"
                type="text"
                placeholder="YYYY-MM-DD"
                autocomplete="off"
              ></b-form-input>
              <b-input-group-append>
                <b-form-datepicker
                  v-model="details.registerend"
                  button-only
                  right
                  locale="en-US"
                  aria-controls="end-date"
                ></b-form-datepicker>
              </b-input-group-append> </b-input-group
          ></b-col>
        </b-row>

        <!-- Row for payment -->
        <h4>ระยะเวลาชำระเงิน</h4>
        <b-row>
          <!-- start date -->

          <b-col
            ><label for="payment-start">ตั้งแต่วันที่</label>
            <b-input-group class="mb-3">
              <b-form-input
                id="payment-start"
                v-model="details.paymentstart"
                type="text"
                placeholder="YYYY-MM-DD"
                autocomplete="off"
              ></b-form-input>
              <b-input-group-append>
                <b-form-datepicker
                  v-model="details.paymentstart"
                  button-only
                  right
                  locale="en-US"
                  aria-controls="payment-start"
                ></b-form-datepicker>
              </b-input-group-append> </b-input-group
          ></b-col>
          <!-- End date -->
          <b-col
            ><label for="payment-end">จนถึงวันที่:</label>
            <b-input-group class="mb-3">
              <b-form-input
                id="payment-ende"
                v-model="details.paymentend"
                type="text"
                placeholder="YYYY-MM-DD"
                autocomplete="off"
              ></b-form-input>
              <b-input-group-append>
                <b-form-datepicker
                  v-model="details.paymentend"
                  button-only
                  right
                  locale="en-US"
                  aria-controls="payment-end"
                ></b-form-datepicker>
              </b-input-group-append> </b-input-group
          ></b-col>
        </b-row>
        <p style="">
          *การโอนเงินคืน : บริษัทฯ จะทําการตัดรอบการรับชําระเงินทุกวัน
          และดําเนินการโอนเงินคืนไปยังบัญชีที่แจ้ง ภายใน 3
          วันทําการนับจากวันที่ตัดยอด (ไม่รวมวันหยุดเสาร์-อาทิตย์
          และวันหยุดนักขัตฤกษ์)
        </p>

        <b-button type="submit" variant="primary" @click="refresh"
          >Submit</b-button
        >
        <b-button type="reset" variant="danger">Reset</b-button>
      </b-form>
      <b-card class="mt-3" header="Form Data Result">
        <pre class="m-0"
          >{{ contact }},{{ payment }},{{ coordinate }},{{ finance }},{{
            details
          }}</pre
        >
      </b-card>
    </b-container>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data() {
    return {
      details: {
        registerfee: '',
        systemfee: '',
        registerstart: '',
        registerend: '',
        paymentstart: '',
        paymentend: '',
      },
      contact: {
        compname: '',
        taxid: '',
        name: '',
        tel: '',
        address: '',
      },
      payment: {
        bankname: '',
        accname: '',
        acctype: '',
        accno: '',
        accbranch: '',
      },
      coordinate: {
        name: '',
        email: '',
        tel: '',
      },
      finance: {
        name: '',
        email: '',
        tel: '',
      },
      show: true,
    }
  },
  methods: {
    async onSubmit(event) {
      event.preventDefault()
      // Post contact
      await axios
        .post('http://localhost:3001/createcontact', {
          compname: this.contact.compname,
          taxid: this.contact.taxid,
          name: this.contact.name,
          tel: this.contact.tel,
          address: this.contact.address,
        })
        .then((response) => {
          console.log(response)
        })
        .catch((err) => {
          console.log(err)
        })
      // Post payment
      await axios
        .post('http://localhost:3001/createpayment', {
          taxid: this.contact.taxid,
          bankname: this.payment.bankname,
          accname: this.payment.accname,
          acctype: this.payment.acctype,
          accno: this.payment.accno,
          accbranch: this.payment.accbranch,
        })
        .then((response) => {
          console.log(response)
        })
        .catch((err) => {
          console.log(err)
        })
      // Post Coordinate
      await axios
        .post('http://localhost:3001/createcoordinate', {
          taxid: this.contact.taxid,
          name: this.coordinate.name,
          email: this.coordinate.email,
          tel: this.coordinate.tel,
        })
        .then((response) => {
          console.log(response)
        })
        .catch((err) => {
          console.log(err)
        })
      // Post Finance
      await axios
        .post('http://localhost:3001/createfinance', {
          taxid: this.contact.taxid,
          name: this.finance.name,
          email: this.finance.email,
          tel: this.finance.tel,
        })
        .then((response) => {
          console.log(response)
        })
        .catch((err) => {
          console.log(err)
        })
      // Post Detail
      await axios
        .post('http://localhost:3001/createdetail', {
          taxid: this.contact.taxid,
          registerfee: this.details.registerfee,
          systemfee: this.details.systemfee,
          registerstart: this.details.registerstart,
          registerend: this.details.registerend,
          paymentstart: this.details.paymentstart,
          paymentend: this.details.paymentend,
        })
        .then((response) => {
          console.log(response)
        })
        .catch((err) => {
          console.log(err)
        })
    },
    onReset(event) {
      event.preventDefault()
      // Reset All Value
      this.contact.compname = ''
      this.contact.taxid = ''
      this.contact.name = ''
      this.contact.tel = ''
      this.contact.address = ''
      this.payment.bankname = ''
      this.payment.accname = ''
      this.payment.acctype = ''
      this.payment.accno = ''
      this.payment.accbranch = ''
      this.coordinate.name = ''
      this.coordinate.email = ''
      this.coordinate.tel = ''
      this.finance.name = ''
      this.finance.email = ''
      this.finance.tel = ''
      this.details.registerfee = ''
      this.details.systemfee = ''
      this.details.registerstart = ''
      this.details.registerend = ''
      this.details.paymentstart = ''
      this.details.paymentend = ''(
        // Trick to reset/clear native browser form validation state
        (this.show = false)
      )
      this.$nextTick(() => {
        this.show = true
      })
    },
  },
}
</script>