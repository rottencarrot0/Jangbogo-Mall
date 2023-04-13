package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.CartDto;
import com.jangbogo.mall.domain.User;
import com.jangbogo.mall.service.CartService;
import com.jangbogo.mall.service.OrderService;
import com.jangbogo.mall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {
    // CartService 자동 주입
    @Autowired
    OrderService orderService;

    @Autowired
    CartService cartService;

    @Autowired
    UserService userService;

    // 메서드명 : goToOrderForm
    // 기   능 : 주문서 작성 페이지로 이동
    // 매개변수 : HttpSession session
    // 반환타입 : String
    // 요청URL : /order/checkout GET
    @GetMapping("/order/checkout")
    public String goToOrderForm(HttpSession session) {
        // 1. 로그인 확인 - loginCheck메서드가 false를 반환하는 경우, 로그인 페이지로 리다이렉트
        if(!loginCheck(session)) return "redirect:/user/login";
        // 2. 로그인 확인 완료 시, 주문서 작성 페이지로 이동
        return "/order/orderForm";
    }

    // 메서드명 : getItemList
    // 기   능 : 주문상품 목록을 불러오는 ajax요청을 처리한다.
    // 반환타입 : ResponseEntity<List<CartDto>>
    // 매개변수 : Integer user_idx
    // 요청URL : /order/checkout/list?user_idx=1234 GET
    @GetMapping("/order/checkout/item-list")
    public ResponseEntity<List<CartDto>> getItemList(Integer user_idx) {
        // 변수명 : list
        // 저장값 : CartDto 저장소 List
        List<CartDto> list = null;
        try {
            // cartService의 getList메서드에 인자로 회원번호를 지정하여 호출, 반환값을 list에 저장
            list = cartService.getList(user_idx);
            // ResponseEntity<List<CartDto> list값과 상태코드를 함께 반환하기 위한 클래스
            // 성공 시, list와 OK상태코드를 반환 - 상태코드 : 200
            return new ResponseEntity<List<CartDto>>(list, HttpStatus.OK);
        } catch (Exception e) {
            // 에러 발생 시, 에러 내용을 로그에 출력
            e.printStackTrace();
            // 에러 발생 시, list값과 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
            return new ResponseEntity<List<CartDto>>(list, HttpStatus.BAD_REQUEST);
        }
    }

    // 메서드명 : getOrdererInfo
    // 기   능 : 주문자 정보 불러오기
    // 반환타입 : ResponseEntity<Map>
    // 요청URL : order/checkout/orderer?user_idx=1234 GET
    @GetMapping("/order/checkout/orderer")
    public ResponseEntity<Map> getOrderInfo(HttpSession session) {
        // 변수명 : ordererInfo
        // 저장값 :
        // TODO : 회원가입, 로그인 기능 테스트 완료 후, 데이터 값이 들어오는지 테스트 요망 (완료) 1. 세션 테스트 2. 서비스 테스트
        Integer idx = (Integer)(session.getAttribute("idx"));

        User user = null;
        String mpno = "";
        String nick_nm = "";
        String email = "";

        Map map = new HashMap();
        try {
            // cartService의 getList메서드에 인자로 회원번호를 지정하여 호출, 반환값을 list에 저장
//            list = cartService.getList(user_idx);
//            ordererInfo = "{ username : 정지우, ph : 01084354496, email : djdu4496@gmail.com}";
            user = userService.selectUser(idx);
            mpno = user.getMpno();
            nick_nm = user.getNick_nm();
            email = user.getEmail();
            map.put("nick_nm", nick_nm);
            map.put("email", email);
            map.put("mpno", mpno);
            // ResponseEntity<List<CartDto> list값과 상태코드를 함께 반환하기 위한 클래스
            // 성공 시, list와 OK상태코드를 반환 - 상태코드 : 200
            return new ResponseEntity<Map>(map, HttpStatus.OK);
        } catch (Exception e) {
            // 에러 발생 시, 에러 내용을 로그에 출력
            e.printStackTrace();
            // 에러 발생 시, list값과 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
            return new ResponseEntity<Map>(map, HttpStatus.BAD_REQUEST);
        }
    }

    // 메서드명 : getDeliveryInfo
    // 기   능 : 배송 정보 불러오기
    // 반환타입 : ResponseEntity<Map>
    // 요청URL : order/checkout/delivery?user_idx=1234 GET
    @GetMapping("/order/checkout/delivery")
    public ResponseEntity<Map> getDeliveryInfo() {
        Map map = new HashMap();
        // 1. 하드코딩
        // 1.1 배송지
        // 1.2 받는 사람
        // 1.3 전화번호
        // 1.4 받으실 장소
        // 1.5 공동현관 비밀번호
        // 1.6 배송완료 메시지
        try {
            String address = "경기 의왕시 원골로 43(모락산현대아파트)118동 202호";
            String recipient = "정지우";
            String mpno = "01084354496";
            String pickUpLocation = "문 앞";
            boolean hasGatePwd = true;
            String gatePwd = "#1234#0000";
            boolean completeMsg = true;
            map.put("address", address);
            map.put("recipient", recipient);
            map.put("mpno", mpno);
            map.put("pickUpLocation", pickUpLocation);
            map.put("hasGatePwd", hasGatePwd);
            map.put("completeMsg", completeMsg);
            // ResponseEntity<List<CartDto> list값과 상태코드를 함께 반환하기 위한 클래스
            // 성공 시, list와 OK상태코드를 반환 - 상태코드 : 200
            return new ResponseEntity<Map>(map, HttpStatus.OK);
        } catch(Exception e) {
            // 에러 발생 시, 에러 내용을 로그에 출력
            e.printStackTrace();
            // 에러 발생 시, list값과 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
            return new ResponseEntity<Map>(map, HttpStatus.BAD_REQUEST);
        }
        // 2. 소프트 코딩
    }

    // 메서드명 : goToRecipientDetails
    // 기   능 : 배송 정보 수정 페이지로 이동
    // 매개변수 : HttpSession session
    // 반환타입 : String
    // 요청URL : /order/checkout/recipient-details GET
    @GetMapping("/order/checkout/recipient-details")
    public String goToRecipientDetails() {
        return "/order/recipientDetails";
    }

    // 메서드명 : getCouponList
    // 기   능 : 쿠폰 목록 불러오기
    // 반환타입 :
    // 요청URL : order/checkout/coupons?user_idx=1234 GET
    @GetMapping("/order/checkout/coupons")
    public ResponseEntity<List<String>> getCouponList() {
        List<String> list = new ArrayList();
        try {
            list.add("첫주문 감사 5천원 할인쿠폰(3만원 이상 주문시)");
            list.add("배송비 무료 쿠폰");
            // ResponseEntity<List<CouponDto> list값과 상태코드를 함께 반환하기 위한 클래스
            // 성공 시, list와 OK상태코드를 반환 - 상태코드 : 200
            return new ResponseEntity<List<String>>(list, HttpStatus.OK);
        } catch(Exception e) {
            // 에러 발생 시, 에러 내용을 로그에 출력
            e.printStackTrace();
            // 에러 발생 시, list값과 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
            return new ResponseEntity<List<String>>(list, HttpStatus.BAD_REQUEST);
        }
    }

    // 메서드명 : loginCheck
    // 기   능 : 로그인 상태 여부 확인
    // 매개변수 : HttpSession session
    // 반환타입 : boolean
    private static boolean loginCheck(HttpSession session) {
        // session에 저장된 idx값이 null이 아니면 true 반환
        return session.getAttribute("idx") != null;
    }
}